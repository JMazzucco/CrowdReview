require 'plos_api'

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
    plos = PlosApi.new

    @total_articles = []

    @user.keywords.length.times do |index|
      plos.get_articles(@user.keywords[index])
      @articles = Article.where('title LIKE :keyword OR abstract LIKE :keyword', keyword: "%#{@user.keywords[index]}%")
      @articles.each do |article|
        @total_articles << article
      end
    end


  end

  #   if params[:search]
  #     @articles = dbsearch( "%#{params[:search]}%")
  #       #if less than 10 articles return from the db, search for articles in PLOS and add them to the db
  #       if @articles.count <= 10
  #         plos = PlosApi.new
  #         plos.get_articles(params[:search])
  #         @articles = dbsearch( "%#{params[:search]}%")
  #       end
  #   else
  #     @articles = Article.all
  #   end
  # end

  # def dbsearch(search)
  #   Article.where('title LIKE :search OR abstract LIKE :search', search: "%#{search}%")
  # end











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
