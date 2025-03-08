require "application_system_test_case"

class EditBlogDetailsTest < ApplicationSystemTestCase
  test "an authenticated user can update the blogs title and description" do
    sign_in_as(users(:one))

    click_on "Edit"

    fill_in "Title", with: "My new blog"
    fill_in "Description", with: "This is all about me"

    click_on "Update Blog"

    assert_current_path posts_path

    assert_text "My new blog"
    assert_text "This is all about me"
  end
end
