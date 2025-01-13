class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category
  validates :recipe, uniqueness: { scope: :category,
    message: "You have already bookmarked that movie to that list" }
end
