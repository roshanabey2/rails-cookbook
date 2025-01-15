class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks
end
