class Comment < ActiveRecord::Base
	belongs_to :article
  belongs_to :user
  has_many :votes
  acts_as_tree order: 'votes_count DESC'
end
