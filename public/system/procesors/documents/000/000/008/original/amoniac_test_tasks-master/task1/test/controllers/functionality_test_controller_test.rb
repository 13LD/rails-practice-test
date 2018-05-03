require 'test_helper'

class FunctionalityTestControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get functionality_test_test_url
    assert_response :success
  end

end
