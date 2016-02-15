class Address < ActiveRecord::Base

  validates :building, :street, :city, :state, :country, :zip, presence: true

  belongs_to :property

  before_save :titleize_attributes

  geocoded_by :street_address
  after_validation :geocode

  def street_address
    [street, city, state, country].compact.join(', ')
  end

  private

    def titleize_attributes
      self.city = city.titleize
      self.state = state.titleize
      self.country = country.titleize
    end
end
