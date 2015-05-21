class AddTitleAndAuthorToComments < ActiveRecord::Migration
   def change
    add_column :comments, :title, :string
    add_column :comments, :author, :string
    change_column :comments, :body, :text
  end
end
