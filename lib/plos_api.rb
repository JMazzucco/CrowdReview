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

  def get_articles(keyword, start=0, rows=10)
    results = @client.search(keyword, start, rows)

    results.each do |r|
      unless Article.find_by(plos_id: r.id)
        if ( r.title && r.abstract && r.authors && r.id && r.published_at )
          Article.create(title: r.title, abstract: r.abstract[0],
                       publication_date: r.published_at,
                       authors: r.authors.to_sentence,
                       plos_id: r.id )
        end
      end
    end
  end

 end
