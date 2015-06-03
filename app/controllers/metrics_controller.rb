class MetricsController < ApplicationController

  def index
    @metrics = Metric.all
  end

  def show
    @metric = Metric.find(params[:id])
  end

end
