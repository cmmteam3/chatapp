require 'test_helper'

class ChannelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get channel_index_url
    assert_response :success
  end

  test "should get new" do
    get channel_new_url
    assert_response :success
  end

  test "should get show" do
    get channel_show_url
    assert_response :success
  end

  test "should get edit" do
    get channel_edit_url
    assert_response :success
  end

end
