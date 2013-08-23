require 'test_helper'

class AppControllerTest < ActionController::TestCase
  test "should get marking" do
    get :marking
    assert_response :success
  end

end
