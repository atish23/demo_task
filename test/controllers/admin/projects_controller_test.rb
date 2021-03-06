require 'test_helper'

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_projects_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_projects_show_url
    assert_response :success
  end

  test "should get create" do
    get admin_projects_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_projects_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_projects_delete_url
    assert_response :success
  end

end
