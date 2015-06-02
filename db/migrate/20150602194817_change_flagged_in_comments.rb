class ChangeFlaggedInComments < ActiveRecord::Migration
  def change
    change_column :comments, :flagged, :boolean, :default => false
  end
end
