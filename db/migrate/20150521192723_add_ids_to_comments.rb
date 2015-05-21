class AddIdsToComments < ActiveRecord::Migration
   def change
    add_column :comments, :article_id, :integer
    add_column :comments, :user_id, :integer
    remove_column :comments, :parent_id
  end
end
