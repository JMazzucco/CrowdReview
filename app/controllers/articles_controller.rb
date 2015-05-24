require 'plos'

class ArticlesController < ApplicationController
skip_before_filter :require_login

  def index
    @articles = Article.all
    if params[:search]
      @hits = article_search(params[:search])
    else
      @hits = []
    end
  end

  def show
    # display an article from the database
    # @article = Article.find(params[:id])
    # @comments = @article.comments.hash_tree

    content = PLOS::Article.content(params[:id])
    render xml: content

  end

  def create
  end

  def new
  end

  private

  def article_search(searchterm)
    client = PLOS::Client.new(ENV["API_KEY"])
    client.search(searchterm, 50)
  end
end
