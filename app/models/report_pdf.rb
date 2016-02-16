class ReportPdf < Prawn::Document
  def initialize(properties)
    super()
    @properties = properties
    table_content
  end

  def table_content
    table property_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 200, 100, 100, 100]
    end
  end

  def property_rows
    [["#", "Description", "Address", "Owner", "Customer"]] +
      @properties.map do |property|
      [property.id, property.description, property.address.street_address, property.owner.name, property.try(:customer).try(:name)]
    end
  end
end