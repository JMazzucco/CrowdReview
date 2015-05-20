class User < ActiveRecord::Base
	validates :password, length: {minimum: 3}
	validates :email, uniqueness: true
	validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
