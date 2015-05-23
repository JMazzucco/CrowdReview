require 'plos'

class ArticlesController < ApplicationController
  @@arefs = Hash.new

  def index
    if params[:search]
      @hits = article_search(params[:search])
      @hits.each {|h| @@arefs[h.id] = h }
    else
      @hits = []
    end
  end

  def show
    id = params[:id]
    article_ref = @@arefs[id]
    @abstract = article_ref.abstract
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
