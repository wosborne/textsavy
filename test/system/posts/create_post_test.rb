require "application_system_test_case"

class CreatePostTest < ApplicationSystemTestCase
  test "should create a post" do
    sign_in_as(users(:one))

    click_on "New post"

    assert_selector "h1", text: "New Post"

    fill_in "Title", with: "New Post Title"
    fill_in_rich_text_area "post_content", with: "Some content."

    click_on "Create Post"

    assert_selector "h1", text: "New Post Title"
    assert_selector "div.trix-content", text: "Some content."
  end

  test "should not display New post button to unauthenticated users" do
    visit root_url

    assert_selector "h1", text: "Blog"

    assert_no_link "New post"
  end
end
