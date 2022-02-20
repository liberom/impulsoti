class Material < ApplicationRecord
  has_many :quantities

  validates :name, uniqueness: true
  validate :check_material_log, on: :destroy

  after_create :create_quantity_zero

  def check_material_log
    erros.add(:name, "Material nao pode ser excluido pois estah incluido no registro") if Log.find_by(material_name: self.name).present?
  end

  def create_quantity_zero
    Quantity.create(material_id: self.id, amount: 0)
  end

end
