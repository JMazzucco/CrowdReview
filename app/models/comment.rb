class Comment < ActiveRecord::Base
	belongs_to :article
  belongs_to :user
  has_many :votes
  acts_as_tree order: 'created_at DESC'
end
