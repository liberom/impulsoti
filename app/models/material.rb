class Material < ApplicationRecord
  validates :name, uniqueness: true

  after_save :create_material_log
  before_destroy :check_material_log

  def create_material_log
    material = Material.find_by(name: self.name)
    Log.create(
      user_email: ApplicationController.logged_user_email,
      material_name: self.name,
      quantity_delta: (material.quantity == 0 ? self.quantity : (material.quantity - self.quantity))
    )
  end

  def check_material_log
    erros.add(:name, "Material nao pode ser excluido pois estah incluido no registro") if Log.find_by(material_name: self.name).present?
  end

  def check_time

  end

  def check_balance

  end

end
