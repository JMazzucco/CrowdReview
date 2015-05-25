class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :comments
  has_many :articles, through: :comments
  has_many :articles, through: :favorites

  mount_uploader :avatar, AvatarUploader
end
