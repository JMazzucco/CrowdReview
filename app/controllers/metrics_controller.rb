class MetricsController < ApplicationController

  def index
    @metrics = Metric.all

  # if params[:search]
  #   @articles = dbsearch( "%#{params[:search]}%")
  #     #if less than 10 articles return from the db, search for articles in PLOS and add them to the db
  #     if @articles.count <= 10
  #       plos = PlosApi.new
  #       plos.get_articles(params[:search])
  #       @articles = dbsearch( "%#{params[:search]}%")
  #     end
  # else
  #   @articles = Article.all
  # end


  end

  def sample_data
    render json: Metric.sample_data
  end

  def show
    @metric = Metric.find(params[:id])
  end

end
