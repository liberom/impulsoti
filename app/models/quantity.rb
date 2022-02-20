class Quantity < ApplicationRecord
  belongs_to :material, foreign_key: :material_id, class_name: 'Material'

  validate :check_negative_balance
  validate :check_working_time

  after_save :create_material_log

  def create_material_log
    unless self.amount == 0 && self == self.material.quantities.order(id: :asc).first
      Log.create(
        user_email: self.user_email,
        material_name: self.material.name,
        quantity_delta: self.amount
      )
    end
  end

  def check_negative_balance
    errors.add(:amount, "Quantidade total nao pode ser negativa") if self.material.quantities.pluck(:amount).sum < 0
  end

  def check_working_time
    if self.amount < 0
      if (Date.today.saturday? || Date.today.sunday?) || (Time.now < Time.parse("09:00") || Time.now > Time.parse("18:00"))
        errors.add(:amount, "Retirada de materiais so pode ser feita entre 9h e 18h de segunda a sexta")
      end
    end
  end
end
