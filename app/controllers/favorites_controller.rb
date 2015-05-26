class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.article_id = params[:article_id]
    if @favorite.save
      redirect_to root_path
    else
      render 'articles/show'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_path
  end

end
