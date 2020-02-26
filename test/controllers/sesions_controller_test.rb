require 'test_helper'

class SesionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sesions_new_url
    assert_response :success
  end

end
