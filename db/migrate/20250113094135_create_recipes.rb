class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.decimal :rating, default: 0

      t.timestamps
    end
  end
end
