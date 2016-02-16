class ReportingService

  attr_reader :type, :properties

  def initialize(type)
    @type = type
    @properties = []
  end

  def find_properties_data
    case @type.to_sym
    when :rent
      @properties = Property.by_type_and_availability("rent", true)
    when :sale
      @properties = Property.by_type_and_availability("sale", true)
    when :sold
      @properties = Property.by_type_and_availability("sale", false).sold_in_year(Date.today.year)
    when :rented
      @properties = Property.by_type_and_availability("rent", false).sold_in_year(Date.today.year)
    end
    @properties
  end
end