require 'test_helper'

class UsersWorkspaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_workspace_index_url
    assert_response :success
  end

  test "should get update" do
    get users_workspace_update_url
    assert_response :success
  end

end
