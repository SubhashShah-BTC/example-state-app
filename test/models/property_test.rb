require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  test "property must have description" do
    property = properties(:one)
    property.description = ""
    assert_not property.valid?
  end

  test "property must have type of availability" do
    property = properties(:one)
    property.available_for = nil
    assert_not property.valid?
  end

  test "property must have owner" do
    property = properties(:one)
    property.owner_id = nil
    assert_not property.valid?
  end

  test "valid property" do
    property = properties(:one)
    assert property.valid?
  end
end
