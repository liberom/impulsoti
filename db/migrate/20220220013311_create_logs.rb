class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :user_email
      t.string :material_name
      t.integer :quantity_delta

      t.timestamps
    end
  end
end
