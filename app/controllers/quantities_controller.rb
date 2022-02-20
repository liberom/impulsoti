class QuantitiesController < ApplicationController
  def create
    session[:user_email] = current_user.email
    @quantity = Quantity.new(quantity_params)
    @material = Material.find(quantity_params[:material_id])

    @quantity.material = @material
    @quantity.save

    render materials_path
  end

  private

  def quantity_params
    params.require(:quantity).permit(:material_id, :amount)
  end



end
