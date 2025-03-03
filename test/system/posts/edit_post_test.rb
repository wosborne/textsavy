require "application_system_test_case"

class EditPostTest < ApplicationSystemTestCase
  test "authenticated user can edit a post" do
    sign_in_as(users(:one))

    click_on "A Live Post"
    click_on "Edit"

    fill_in "Title", with: "Updated Post"
    fill_in_rich_text_area "post_content", with: "This is updated content"

    click_on "Update Post"

    assert_current_path post_path(posts(:live))
    assert_text "Updated Post"
    assert_text "This is updated content"
  end

  test "unauthenticated user is redirected to root" do
    visit edit_post_path(posts(:live))

    assert_current_path new_session_path
  end

  test "returns errors if required fields missing" do
    sign_in_as(users(:one))

    click_on "A Live Post"
    click_on "Edit"

    fill_in "Title", with: ""
    fill_in_rich_text_area "post_content", with: ""

    click_on "Update Post"

    assert_text "Title can't be blank"
    assert_text "Content can't be blank"
  end
end
