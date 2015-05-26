class FavoritesController < ApplicationController

  def create
    article = Article.find params[:article_id]

    if favorite = current_user.favorites.find_by(article: article)
      favorite.destroy
    else
      current_user.favorites.create(article: article)
    end

    redirect_to article
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to current_user
  end

end
