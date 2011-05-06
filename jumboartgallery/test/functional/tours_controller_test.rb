require 'test_helper'

class ToursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
