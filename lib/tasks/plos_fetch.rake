namespace :plos_fetch do
  desc "Get articles from PLOS"
  task get_api_articles: :environment do
    api = PlosApi.new
    puts "api.get_api_articles"
    api.get_articles
  end
end
