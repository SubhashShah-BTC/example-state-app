class PropertiesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :load_countries, only: [:index, :search]
  load_resource :property
  load_resource :address, through: :property

  def new
    @property.build_address
  end

  def create
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

  def search
    @properties = Property.by_country(params[:country])
    render "index"
  end

  def reports
  end

  def purchase
    if @property.update_attributes(customer_id: current_user.id, sold_or_rented_on: Date.today, available: false)
      redirect_to properties_path, flash: {success: "Property updated successfully."}
    else
      render "show", flash: {error: @property.errors.full_messages.join("\n")}
    end
  end

  private

    def property_params
      params.require(:property).permit(:description, :established_on, :available_for, address_attributes: [:building, :street, :landmark, :city, :state, :country, :zip], pictures_attributes: [:image])
    end

    def load_countries
      @countries = Address.pluck(:country).uniq
    end

end
