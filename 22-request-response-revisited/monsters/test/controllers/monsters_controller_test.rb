require 'test_helper'

class MonstersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
