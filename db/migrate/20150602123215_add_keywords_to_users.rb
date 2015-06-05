class AddKeywordsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :keywords, :text
  end
end
