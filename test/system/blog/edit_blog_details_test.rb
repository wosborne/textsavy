require "application_system_test_case"

class EditBlogDetailsTest < ApplicationSystemTestCase
  test "an authenticated user can update the blogs title and description" do
    sign_in_as(users(:one))

    click_on "Edit"

    fill_in "Title", with: "My new blog"
    fill_in "Description", with: "This is all about me"

    click_on "Update Blog"

    assert_current_path root_path

    assert_text "My new blog"
    assert_text "This is all about me"
  end

  test "an unathenticated user can not see the edit button" do
    visit root_path

    assert_current_path root_path
    assert_no_text "Edit"
  end
end
