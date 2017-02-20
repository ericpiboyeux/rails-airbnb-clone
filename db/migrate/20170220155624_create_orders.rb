class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :portions
      t.text :review_description
      t.integer :review_rating
      t.references :user, foreign_key: true
      t.references :availability, foreign_key: true

      t.timestamps
    end
  end
end
