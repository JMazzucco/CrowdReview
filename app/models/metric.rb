class Metric
  include HTTParty
  # base_uri 'alm.plos.org/api/v5'
  base_uri 'api.altmetric.com/v1/'

  class << self
    def all
      get('/citations/1w')['results']
       # get('/articles')['data']
    end

    # def some
    #   get "/otherthing/whatever"
    # end

    def sample_data
      json = JSON.parse File.read("db/sample_data.json")
      sorted_json = json["results"].sort_by { |r| -r["score"] }
    end
  end

end