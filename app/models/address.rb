class Address < ActiveRecord::Base

  validates :building, :street, :city, :state, :country, :zip, presence: true

  belongs_to :property
end
