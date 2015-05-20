class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.string :body
      t.integer :votes

      t.timestamps null: false
    end
  end
end
