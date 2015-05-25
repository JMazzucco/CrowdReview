class AddColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :publication_date, :datetime
    add_column :articles, :plos_id, :string
    add_column :articles, :authors, :string
  end
end
