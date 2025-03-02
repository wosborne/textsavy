require "application_system_test_case"

class CreatePostTest < ApplicationSystemTestCase
  test "authenticated users can create a post" do
    sign_in_as(users(:one))

    click_on "New post"

    assert_selector "h1", text: "New Post"

    fill_in "Title", with: "New Post Title"
    fill_in_rich_text_area "post_content", with: "Some content."

    click_on "Create Post"

    assert_selector "h1", text: "New Post Title"
    assert_selector "div.trix-content", text: "Some content."
  end

  test "unauthenticated users are redirected to sign in" do
    visit new_post_path

    assert_text "Sign in"
  end
end
