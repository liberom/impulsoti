class Material < ApplicationRecord
  has_many :quantities

  validates :name, uniqueness: true

  before_destroy :check_material_log


  def check_material_log
    erros.add(:name, "Material nao pode ser excluido pois estah incluido no registro") if Log.find_by(material_name: self.name).present?
  end

  def check_time

  end



end
