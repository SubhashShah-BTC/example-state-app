class Api::V1::PropertiesController < Api::V1::ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with Property.all
  end
end