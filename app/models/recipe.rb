class Recipe < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, allow_blank: false
  validates :rating, inclusion: 0..10
  has_many :bookmarks
end
