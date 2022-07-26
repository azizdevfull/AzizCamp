require "test_helper"

class ModeratorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moderator_index_url
    assert_response :success
  end

  test "should get projects" do
    get moderator_projects_url
    assert_response :success
  end

  test "should get attachers" do
    get moderator_attachers_url
    assert_response :success
  end

  test "should get tasks" do
    get moderator_tasks_url
    assert_response :success
  end

  test "should get posters" do
    get moderator_posters_url
    assert_response :success
  end

  test "should get pcomments" do
    get moderator_pcomments_url
    assert_response :success
  end

  test "should get users" do
    get moderator_users_url
    assert_response :success
  end

  test "should get roject" do
    get moderator_roject_url
    assert_response :success
  end

  test "should get show_poster" do
    get moderator_show_poster_url
    assert_response :success
  end
end
