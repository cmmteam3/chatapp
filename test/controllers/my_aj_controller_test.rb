require 'test_helper'

class MyAjControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_aj_new_url
    assert_response :success
  end

end
