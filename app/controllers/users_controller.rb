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
    @articles = []
    @keywords = @user.keywords

    @keywords.length.times do |index|
      plos.get_articles(@user.keywords[index])
      @results = Article.where('title LIKE :keyword OR abstract LIKE :keyword', keyword: "%#{@user.keywords[index]}%")
      @results.each do |article|
        @articles << article
      end
    end

    # respond_to do |f|
    #   f.html
    #   f.js
    # end
  end

  def update

    @user = User.find(current_user.id)
    keyword = keyword_param['keyword'].downcase.strip

    if @user.keywords.include?(keyword)
      puts "already included"
      flash[:notice] = 'Keyword has already been added'
    else
      appended_array = @user.keywords << keyword
      @user.update_attribute(:keywords, appended_array)
    end

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
