class Article < ActiveRecord::Base
	has_many :comments
  has_many :users, through: :comments
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :users

  validates :title, uniqueness: true
  validate :abstract_must_have_ten_words_or_more

  def abstract_must_have_ten_words_or_more
    if abstract.split.count < 10
      errors.add(:abstract, "can't have less than ten words")
    end
  end

end
