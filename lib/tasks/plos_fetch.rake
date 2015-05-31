

namespace :plos_fetch do
  desc "Get articles from PLOS"
  task collect_articles: :environment do
    api = PlosApi.new
    api.collect_all_articles
    puts "Added 10 new articles to the database"
  end
end
