class Address < ActiveRecord::Base

  validates :building, :street, :city, :state, :country, :zip, presence: true

  belongs_to :property

  before_save :titleize_attributes

  private

    def titleize_attributes
      self.city = city.titleize
      self.state = state.titleize
      self.country = country.titleize
    end
end
