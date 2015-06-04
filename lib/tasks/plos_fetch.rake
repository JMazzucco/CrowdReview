namespace :plos_fetch do
  desc "Get articles from PLOS"
  task :collect_articles, [:start_num] do |t, arg|
    api = PlosApi.new
    api.collect_all_articles(arg.start_num)
    puts "New articles were added to the database"
  end

  desc "Get more articles from PLOS"
  task :get_articles => :environment do
    api = PlosApi.new
    api.get_articles('calcium', 0, 400)
    puts "New articles were added to the database"
  end

  desc "Serialize articles from PLOS"
  task :get_documents => :environment do
    api = PlosApi.new
    api.get_documents
    puts "New articles were added to the database"
  end
end
