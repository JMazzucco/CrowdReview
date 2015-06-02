class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :comments
  has_many :favorites
  has_many :articles, through: :comments
  has_many :favorite_articles, through: :favorites, source: :article
  has_one :vote

  mount_uploader :avatar, AvatarUploader
  serialize :keywords,Array
end
