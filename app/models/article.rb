class Article < ActiveRecord::Base
	has_many :comments
  has_many :users, through: :comments
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :users

  validates :title, uniqueness: true

end
