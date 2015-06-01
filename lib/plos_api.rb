class PlosApi

  require 'plos'

  def initialize
    @client = PLOS::Client.new(ENV["API_KEY"])
  end

  def collect_all_articles(start)
    #a loop that will create an array of 10 new records from PLOS.
    results = []
     until results.count >= 10
     @start = start.to_i
     results = @client.all(@start, 100)
     #if a record has less than 10 words in the abstract, remove it from the array of search results

      results.keep_if do |r|
       !r.abstract.nil?
      end
      @start += 100
     end

    results.each do |r|
      unless Article.find_by(plos_id: r.id)
          Article.create(title: r.title, abstract: r.abstract[0],
                       publication_date: r.published_at,
                       authors: r.authors.to_sentence,
                       plos_id: r.id )
      end
    end
  end

  def get_articles(keyword)

    results = @client.search(keyword, 1, 10)

    results.each do |r|
      unless Article.find_by(plos_id: r.id)
        if ( r.title && r.abstract.length > 10 && r.authors && r.id && r.published_at )
          Article.create(title: r.title, abstract: r.abstract[0],
                       publication_date: r.published_at,
                       authors: r.authors.to_sentence,
                       plos_id: r.id )
        end
      end
    end
  end
 end
