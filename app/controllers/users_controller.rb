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
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :avatar)
  end
end
