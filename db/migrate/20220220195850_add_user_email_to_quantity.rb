class AddUserEmailToQuantity < ActiveRecord::Migration[6.1]
  def change
    add_column :quantities, :user_email, :string
  end
end
