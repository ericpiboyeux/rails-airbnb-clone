class AddLeftPortionsToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :left_portions, :integer
  end
end
