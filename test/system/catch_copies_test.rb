require "application_system_test_case"

class CatchCopiesTest < ApplicationSystemTestCase
  setup do
    @catch_copy = catch_copies(:one)
  end

  test "visiting the index" do
    visit catch_copies_url
    assert_selector "h1", text: "Catch Copies"
  end

  test "creating a Catch copy" do
    visit catch_copies_url
    click_on "New Catch Copy"

    fill_in "Image", with: @catch_copy.image
    fill_in "Job category", with: @catch_copy.job_category
    fill_in "Target", with: @catch_copy.target
    fill_in "Title", with: @catch_copy.title
    fill_in "User", with: @catch_copy.user_id
    click_on "Create Catch copy"

    assert_text "Catch copy was successfully created"
    click_on "Back"
  end

  test "updating a Catch copy" do
    visit catch_copies_url
    click_on "Edit", match: :first

    fill_in "Image", with: @catch_copy.image
    fill_in "Job category", with: @catch_copy.job_category
    fill_in "Target", with: @catch_copy.target
    fill_in "Title", with: @catch_copy.title
    fill_in "User", with: @catch_copy.user_id
    click_on "Update Catch copy"

    assert_text "Catch copy was successfully updated"
    click_on "Back"
  end

  test "destroying a Catch copy" do
    visit catch_copies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Catch copy was successfully destroyed"
  end
end
