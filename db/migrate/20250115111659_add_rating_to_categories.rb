class AddRatingToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :rating, :decimal, default: 0.0
  end
end
