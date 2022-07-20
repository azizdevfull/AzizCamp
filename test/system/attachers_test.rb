require "application_system_test_case"

class AttachersTest < ApplicationSystemTestCase
  setup do
    @attacher = attachers(:one)
  end

  test "visiting the index" do
    visit attachers_url
    assert_selector "h1", text: "Attachers"
  end

  test "should create attacher" do
    visit attachers_url
    click_on "New attacher"

    fill_in "Attachment", with: @attacher.attachment
    fill_in "Name", with: @attacher.name
    fill_in "Project", with: @attacher.project_id
    click_on "Create Attacher"

    assert_text "Attacher was successfully created"
    click_on "Back"
  end

  test "should update Attacher" do
    visit attacher_url(@attacher)
    click_on "Edit this attacher", match: :first

    fill_in "Attachment", with: @attacher.attachment
    fill_in "Name", with: @attacher.name
    fill_in "Project", with: @attacher.project_id
    click_on "Update Attacher"

    assert_text "Attacher was successfully updated"
    click_on "Back"
  end

  test "should destroy Attacher" do
    visit attacher_url(@attacher)
    click_on "Destroy this attacher", match: :first

    assert_text "Attacher was successfully destroyed"
  end
end
