namespace :plos_fetch do
  desc "Get articles from PLOS"
 	task :collect_articles, [:start_num] do |t, arg|
    api = PlosApi.new
    api.collect_all_articles(arg.start_num)
    puts "New articles were added to the database"
  end
end
