require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user must have name" do
    customer = users(:customer)
    customer.name = ""
    assert_not customer.valid?
  end

  test "user must have mobile number" do
    customer = users(:customer)
    customer.mobile_number = ""
    assert_not customer.valid?
  end

  test "user must have role" do
    customer = users(:customer)
    customer.role = nil
    assert_not customer.valid?
  end

  test "user must have unique mobile number" do
    customer = users(:customer)
    agent = users(:agent)
    agent.mobile_number = customer.mobile_number
    assert_not agent.valid?
  end

  test "customer is valid user" do
    customer = users(:customer)
    assert customer.valid?
  end
end
