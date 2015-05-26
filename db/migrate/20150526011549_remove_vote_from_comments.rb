class RemoveVoteFromComments < ActiveRecord::Migration
	def change
    remove_column :comments, :votes
  end
end
