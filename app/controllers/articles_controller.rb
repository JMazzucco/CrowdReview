require 'plos'

class ArticlesController < ApplicationController

  def index
    if params[:search]
      @hits = article_search(params[:search])
    else
      @hits = []
    end
  end

  def show
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
    client.search(searchterm, 100, 50)
  end
end
