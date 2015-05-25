class Comment < ActiveRecord::Base
	belongs_to :article
  belongs_to :user
  acts_as_tree order: 'created_at DESC'
  after_initialize :init

  private
    def init
        self.votes ||= 0
    end
end
