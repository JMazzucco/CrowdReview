class PlosApi

  require 'plos'

  def initialize
    @client = PLOS::Client.new(ENV["API_KEY"])
  end

  def get_articles
    searchterm = 'apple'
    results = @client.search(searchterm, 50)
    results.each do |r|
      Article.create(title: r.title, abstract: r.abstract )
    end
  end

end
