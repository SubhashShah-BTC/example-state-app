class AddressSerializer < ActiveModel::Serializer
  attributes :id, :building, :street, :landmark, :city, :state, :country
end
