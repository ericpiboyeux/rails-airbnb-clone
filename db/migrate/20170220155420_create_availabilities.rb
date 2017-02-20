class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.datetime :available_datetime
      t.integer :portions
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
