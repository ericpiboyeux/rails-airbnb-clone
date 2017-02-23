class AddPriceToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :price, :integer
  end
end
