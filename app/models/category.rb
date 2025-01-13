class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks
end
