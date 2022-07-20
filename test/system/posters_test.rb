require "application_system_test_case"

class PostersTest < ApplicationSystemTestCase
  setup do
    @poster = posters(:one)
  end

  test "visiting the index" do
    visit posters_url
    assert_selector "h1", text: "Posters"
  end

  test "should create poster" do
    visit posters_url
    click_on "New poster"

    fill_in "Body", with: @poster.body
    fill_in "Title", with: @poster.title
    click_on "Create Poster"

    assert_text "Poster was successfully created"
    click_on "Back"
  end

  test "should update Poster" do
    visit poster_url(@poster)
    click_on "Edit this poster", match: :first

    fill_in "Body", with: @poster.body
    fill_in "Title", with: @poster.title
    click_on "Update Poster"

    assert_text "Poster was successfully updated"
    click_on "Back"
  end

  test "should destroy Poster" do
    visit poster_url(@poster)
    click_on "Destroy this poster", match: :first

    assert_text "Poster was successfully destroyed"
  end
end
