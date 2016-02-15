class PropertiesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  load_resource :property
  load_resource :address, through: :property

  def new
    @property.build_address
  end

  def create
    binding.pry
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to properties_path, flash: { success: "Property details saved successfully." }
    else
      render "new"
    end
  end

  def update
    @property = Property.find_by(id: params[:id])
    if @property.update_attributes(property_params)
      redirect_to properties_path, flash: { success: "Property details updated successfully." }
    else
      render "edit"
    end
  end

  private

    def property_params
      params.require(:property).permit(:description, :established_on, :available_for, address_attributes: [:building, :street, :landmark, :city, :state, :country, :zip], pictures_attributes: [:image])
    end

end
