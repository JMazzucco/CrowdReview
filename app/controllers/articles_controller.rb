class ArticlesController < ApplicationController
  skip_before_filter :require_login

  def index
    @articles = if params[:search]
      Article.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
    if current_user.admin?
      @comments = @article.comments.hash_tree
    else
      @comments = @article.comments.where(flagged: false).hash_tree
    end
    @favorite = @article.favorites.build
  end

  def create
  end

  def new
  end

end
