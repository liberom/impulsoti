class Quantity < ApplicationRecord
  belongs_to :material, foreign_key: :material_id, class_name: 'Material'

  validate :check_negative_balance

  after_save :create_material_log

  def create_material_log
    Log.create(
      user_email: ApplicationController.logged_user_email,
      material_name: self.material.name,
      quantity_delta: self.amount
    )
  end

    def check_negative_balance
      errors.add(:amount, "Quantidade total nao pode ser negativa") if self.material.quantities.pluck(:amount).sum < 0
    end
end
