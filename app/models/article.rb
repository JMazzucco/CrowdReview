class Article < ActiveRecord::Base
	has_many :comments
  has_many :users, through: :comments
  has_many :users, through: :favorites

  validates :title, uniqueness: true

end
