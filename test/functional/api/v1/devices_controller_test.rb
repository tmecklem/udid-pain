require 'test_helper'

class Api::V1::DevicesControllerTest < ActionController::TestCase
  test "should get status" do
    get :status
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

end
