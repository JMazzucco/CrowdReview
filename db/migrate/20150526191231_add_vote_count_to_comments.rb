class AddVoteCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :votes_count, :integer

    Comment.find_each { |c| Comment.reset_counters(c.id, :votes) }
  end
end
