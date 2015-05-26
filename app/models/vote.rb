class Vote < ActiveRecord::Base
	belongs_to :comment, counter_cache: true
  belongs_to :user
  # after_save :update_vote_count_on_comment

  # def update_vote_count_on_comment
  # 	self.comment.vote_count = Vote.where(comment_id: self.comment_id).count
  # end
end
