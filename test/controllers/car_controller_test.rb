require "test_helper"

class CarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_index_url
    assert_response :success
  end
end
