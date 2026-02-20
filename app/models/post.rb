class Post < ApplicationRecord
  # Establish the relationship to fix the 'undefined method comments' error
  has_many :comments, dependent: :destroy

  # Validations to ensure posts are created correctly
  validates :title, presence: true
  validates :content, presence: true
end