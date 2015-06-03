class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]
  before_filter :admin_user, only: :index

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @uploader = AvatarUploader.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      UserMailer.welcome_email(@user).deliver_now
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = Comment.where(user_id: params[:id])
    @total = Comment.where(user_id: params[:id]).count
    @favorite = @user.favorites

    # unless (@user.id == current_user.id) || current_user.admin?
    #   flash[:notice] = "You don't have access to this profile!"
    #   redirect_to root_path
    #   return
    # end
  end

  def destroy
    @user = User.find(params[:id])

    if params[:index]
      if @user.keywords.length > 1
        @user.keywords.delete_at(params[:index].to_i)
        @user.update_attribute(:keywords, @user.keywords)
      else
        @user.update_attribute(:keywords, [])
      end
      redirect_to user_feed_path(params[:id])
    else
      @user.destroy
      redirect_to users_path
    end
  end

  def feed
    @user = User.find(params[:user_id])
    @total_articles = []

    @user.keywords.length.times do |index|
      @articles = Article.where('title LIKE :keyword OR abstract LIKE :keyword', keyword: "%#{@user.keywords[index]}%")
      @articles.each do |article|
        @total_articles << article
      end
    end
    # @article_feed = []
    # @user.keywords.each do |keyword|
    #   if @user.keywords.length > 0
    #     @article_feed << Article.where('title LIKE :keyword OR abstract LIKE :keyword', keyword: "%#{@user.keywords[0]}%")
    #   end
  end

  def update
    @user = User.find(current_user.id)
    appended_array = @user.keywords << keyword_param['keyword']
    @user.update_attribute(:keywords, appended_array)
    redirect_to user_feed_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :avatar)
  end

  def keyword_param
    params.permit(:keyword)
  end
end
