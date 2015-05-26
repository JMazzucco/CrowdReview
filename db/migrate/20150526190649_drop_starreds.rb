class DropStarreds < ActiveRecord::Migration
  def change
    drop_table :starreds
  end
end
