require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  test "new restaurant fields must not be empty" do
      newRest = Restaurant.new
      assert newRest.invalid?
      assert newRest.errors[:name].any?
      assert newRest.errors[:address].any?
      assert newRest.errors[:city].any?
      assert newRest.errors[:state].any?
      assert newRest.errors[:zip].any?
    end

    test "new restaurant state must be 2 letters" do
      newRest1 = restaurants(:one)
      assert newRest1.valid?
      newRest1.state = "Cali"
      assert newRest1.invalid?
      assert newRest1.errors[:state].any?
      newRest1.state = "CALI"
      assert newRest1.invalid?
      assert newRest1.errors[:state].any?
      newRest1.state = "C@l1"
      assert newRest1.invalid?
      assert newRest1.errors[:state].any?
      newRest1.state = "CA"
      assert newRest1.valid?
    end

    test "restaurant state must be capital letters" do
      newRest2 = restaurants(:two)
      assert newRest2.valid?
      newRest2.state = "Florida"
      assert newRest2.invalid?
      assert newRest2.errors[:state].any?
      newRest2.state = "Fl"
      assert newRest2.invalid?
      assert newRest2.errors[:state].any?
      newRest2.state = "12"
      assert newRest2.invalid?
      assert newRest2.errors[:state].any?
      newRest2.state = "FL"
      assert newRest2.valid?
    end

end
