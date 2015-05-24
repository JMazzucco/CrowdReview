class PlosApi

  require 'plos'

  def initialize
    puts "PlosApi::initialize"
    @client = PLOS::Client.new(ENV["API_KEY"])
  end

  def get_articles
    puts "PlosApi::get_articles"
    searchterm = 'apple'
    results = @client.search(searchterm, 50)
    results.each do |r|

    # articles = @client.get_articles....
    #                                articles.each do |article|
    #   Article.create(name: article[:key])
    # end
  end

end
