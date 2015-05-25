require 'plos'

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
    @comments = @article.comments.hash_tree
  end

  def create
  end

  def new
  end

end
