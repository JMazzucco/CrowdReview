class PlosApi

  require 'plos'

  def initialize
    puts "PlosApi::initialize"
    # @client = PLOS::API.new(username, password)
  end

  def get_articles
    puts "PlosApi::get_articles"
    # articles = @client.get_articles....
    #                                articles.each do |article|
    #   Article.create(name: article[:key])
    # end
  end

end
