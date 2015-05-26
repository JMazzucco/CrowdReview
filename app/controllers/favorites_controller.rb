class FavoritesController < ApplicationController

  def create

    # @favorite = Favorite.new
    # @favorite.user = current_user
    # @favorite.article_id = params[:article_id]

    # article = Article.find params[:article_id]
    # @favorite = Favorite.new(user: current_user, article: article)

    # unless current_user.favorites.find_by(article: article)
    #   @favorite = Favorite.new
    #   @favorite.user = current_user
    #   @favorite.article_id = params[:article_id]
    # end

    article = Article.find params[:article_id]

    if favorite = current_user.favorites.find_by(article: article)
      favorite.destroy
    else
      current_user.favorites.create(article: article)
    end

    redirect_to article

    # if @favorite.save
    #   redirect_to root_path
    # else
    #   render 'articles/show'
    # end
  end

  def destroy
    # @favorite = Favorite.find(params[:id])
    # @favorite.destroy
    # @user = current_user.id
    # redirect_to user_path(@user)

    Favorite.find(params[:id]).destroy
    redirect_to current_user
  end

end
