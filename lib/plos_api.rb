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

        if ( r.title && has_more_than_ten_words( r.abstract[0] ) && r.authors && r.id && r.published_at )
          content = get_content(r)
          fs = get_funding_statement(content)
          Article.create(title: r.title, abstract: r.abstract[0],
                       publication_date: r.published_at,
                       authors: r.authors.to_sentence,
                       fundingstatement: fs,
                       content: content,
                       plos_id: r.id )
        end
      end
    end
  end

  private

  def get_content(r)
    content = nil
    if r then
      content = Nokogiri::XML(PLOS::Article.content(r.id))
    end
  end

  def get_funding_statement(content)
    text = nil
    search_results = content.xpath("//funding-group/funding-statement")
    if search_results && search_results.length > 0 then
      text = search_results[0].content
    end
    text
  end

  def has_more_than_ten_words(text)
    text.split.count > 10
  end

 end
