class PlosApi

  require 'plos'

  def initialize
    @client = PLOS::Client.new(ENV["API_KEY"])
  end

  def get_articles

    results = @client.search("cannabidiol")
    # results = @client.all(0,50)
    results.each do |r|

      if ( r.title && r.abstract && r.authors && r.id && r.published_at  )
        Article.create!(title: r.title, abstract: r.abstract[0],
                     publication_date: r.published_at,
                     authors: r.authors.to_sentence,
                     plos_id: r.id )
      end
    end
  end

end
