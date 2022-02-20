class CreateQuantities < ActiveRecord::Migration[6.1]
  def change
    create_table :quantities do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
