class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :content, :text
    add_column :articles, :fundingstatement, :text
  end
end
