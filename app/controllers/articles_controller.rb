require 'plos_api'

class ArticlesController < ApplicationController
  skip_before_filter :require_login

  def index
    if params[:search]
      @articles = dbsearch( "%#{params[:search]}%")
        #if less than 10 articles return from the db, search for articles in PLOS and add them to the db
        if @articles.count <= 10
          plos = PlosApi.new
          plos.get_articles(params[:search])
          @articles = dbsearch( "%#{params[:search]}%")
        end
    else
      @articles = Article.all
    end
  end

  def dbsearch(search)
    Article.where('title LIKE :search OR abstract LIKE :search', search: "%#{search}%")
  end

  def show
    @article = Article.find(params[:id])
    if current_user && current_user.admin
      @comments = @article.comments.hash_tree
    else
      @comments = @article.comments.where.not(flagged: true).hash_tree
    end
      @favorite = @article.favorites.build
  end

end
