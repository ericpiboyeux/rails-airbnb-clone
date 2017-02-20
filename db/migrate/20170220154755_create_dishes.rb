class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.boolean :gluten_free
      t.boolean :vegetarian
      t.boolean :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
