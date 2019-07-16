require 'test_helper'

class ThreadRepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get thread_replies_show_url
    assert_response :success
  end

end
