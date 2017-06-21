require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  def test_restaurant_is_invalid_without_name
  end

  def test_restaurant_is_invalid_without_opening_hour
  end

  def test_restaurant_is_invalid_without_closing_hour
  end

  def test_restaurant_is_available_when_empty_during_opening_hours
  end

  def test_restaurant_is_available_when_under_capacity_during_opening_hours
  end

  def test_restaurant_is_available_later_same_day
  end

  def test_restaurant_is_unavailable_in_the_past
  end

  def test_restaurant_is_unavailable_when_full
  end

  def test_restaurant_is_unavailable_before_opening
  end

  def test_restaurant_is_available_at_opening
  end

  def test_restaurant_is_unavailable_at_closing_time
  end

  def test_restaurant_is_unavailable_past_closing_time
  end

end
