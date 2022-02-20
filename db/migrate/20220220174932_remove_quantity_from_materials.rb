class RemoveQuantityFromMaterials < ActiveRecord::Migration[6.1]
  def change
    remove_column :materials, :quantity
  end
end
