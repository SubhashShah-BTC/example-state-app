class PropertySerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :description, :established_on, :available_for, :available, :sold_or_rented_on
  has_one :address
  has_one :owner
  has_one :customer
end