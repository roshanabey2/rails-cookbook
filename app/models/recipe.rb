class Recipe < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, allow_blank: false
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  has_many :bookmarks
end
