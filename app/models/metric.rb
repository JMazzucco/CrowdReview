class Metric
  include HTTParty
  # base_uri 'alm.plos.org'
  base_uri 'api.altmetric.com/v1/'

  def self.all
    get('/citations/1d')['results']
  end

end