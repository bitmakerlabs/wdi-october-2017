require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  def test_restaurant_is_invalid_without_name
    # arrange
    restaurant = Restaurant.new(opening_hour: 10, closing_hour: 23)

    # Act
    is_valid = restaurant.valid?

    # assert
    refute(is_valid)
  end

  def test_restaurant_is_invalid_without_opening_hour
    # arrange
    restaurant = Restaurant.new(name: "Tyler's Kitchen", closing_hour: 3)

    # act
    if_valid = restaurant.valid?

    # assert
    refute(if_valid)
  end

  def test_restaurant_is_invalid_without_closing_hour
    # arrange
    restaurant = Restaurant.new(name: "Chez Spencer", opening_hour: 4)

    # act
    valid = restaurant.save

    # assert
    refute(valid)
  end

  def test_restaurant_is_available_when_empty_during_opening_hours
    skip
  end

  def test_restaurant_is_available_when_under_capacity_during_opening_hours
    skip
  end

  def test_restaurant_is_available_later_same_day
    skip
  end

  def test_restaurant_is_unavailable_in_the_past
    skip
  end

  def test_restaurant_is_unavailable_when_full
    skip
  end

  def test_restaurant_is_unavailable_before_opening
    skip
  end

  def test_restaurant_is_available_at_opening
    skip
  end

  def test_restaurant_is_unavailable_at_closing_time
    skip
  end

  def test_restaurant_is_unavailable_past_closing_time
    skip
  end

end
