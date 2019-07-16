require 'test_helper'

class WorkspaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workspace_index_url
    assert_response :success
  end

  test "should get edit" do
    get workspace_edit_url
    assert_response :success
  end

  test "should get show" do
    get workspace_show_url
    assert_response :success
  end

end
