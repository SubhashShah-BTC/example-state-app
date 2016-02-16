require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "address must have building" do
    address = addresses(:one)
    address.building = ""
    assert_not address.valid?
  end

  test "address must have street" do
    address = addresses(:one)
    address.street = ""
    assert_not address.valid?
  end

  test "address must have city" do
    address = addresses(:one)
    address.city = ""
    assert_not address.valid?
  end

  test "address must have state" do
    address = addresses(:one)
    address.state = ""
    assert_not address.valid?
  end

  test "address must have country" do
    address = addresses(:one)
    address.country = ""
    assert_not address.valid?
  end

  test "address must have zip" do
    address = addresses(:one)
    address.zip = ""
    assert_not address.valid?
  end

  test "it must titleize city state and country" do
    address = addresses(:one)
    address.city = "mumbai"
    address.state = "maharashtra"
    address.country = "india"
    address.save!
    assert_equal address.city, "Mumbai"
    assert_equal address.state, "Maharashtra"
    assert_equal address.country, "India"
  end

  test "address must have geocodes" do
    address = addresses(:one)
    address.city = "mumbai"
    address.state = "maharashtra"
    address.country = "india"
    address.save!
    assert_not_nil address.longitude
    assert_not_nil address.latitude
  end

end
