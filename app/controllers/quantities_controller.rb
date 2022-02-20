class QuantitiesController < ApplicationController
  def create
    @quantity = Quantity.new(quantity_params)
    @material = Material.find(quantity_params[:material_id])

    @quantity.material = @material
    if @quantity.save
      redirect_to materials_path
    else
      redirect_to materials_path, alert: "erro: #{@quantity.errors.first.type}"
    end

  end

  private

  def quantity_params
    params.require(:quantity).permit(:material_id, :user_email, :amount)
  end



end
