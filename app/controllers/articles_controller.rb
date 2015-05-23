class ArticlesController < ApplicationController
  skip_before_filter :require_login

  def index
  	@articles = Article.all
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
