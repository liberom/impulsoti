class AddMaterialIdToQuantity < ActiveRecord::Migration[6.1]
  def change
    add_column :quantities, :material_id, :integer
  end
end
