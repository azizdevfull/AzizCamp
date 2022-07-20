require "test_helper"

class AttachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attacher = attachers(:one)
  end

  test "should get index" do
    get attachers_url
    assert_response :success
  end

  test "should get new" do
    get new_attacher_url
    assert_response :success
  end

  test "should create attacher" do
    assert_difference("Attacher.count") do
      post attachers_url, params: { attacher: { attachment: @attacher.attachment, name: @attacher.name, project_id: @attacher.project_id } }
    end

    assert_redirected_to attacher_url(Attacher.last)
  end

  test "should show attacher" do
    get attacher_url(@attacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_attacher_url(@attacher)
    assert_response :success
  end

  test "should update attacher" do
    patch attacher_url(@attacher), params: { attacher: { attachment: @attacher.attachment, name: @attacher.name, project_id: @attacher.project_id } }
    assert_redirected_to attacher_url(@attacher)
  end

  test "should destroy attacher" do
    assert_difference("Attacher.count", -1) do
      delete attacher_url(@attacher)
    end

    assert_redirected_to attachers_url
  end
end
