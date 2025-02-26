require "application_system_test_case"

class CreatePostTest < ApplicationSystemTestCase
  test "should create a post" do
    sign_in_as(users(:one))

    click_on "New Post"

    assert_selector "h1", text: "New Post"

    fill_in "Title", with: "New Post Title"
    find("trix-editor").click.set("New text")

    click_on "Create Post"

    assert_selector "h1", text: "New Post Title"
    assert_selector "div", text: "New text"
  end

  test "should redirect unauthenticated user to sign in" do
    visit root_url

    click_on "New Post"

    assert_no_selector "h1", text: "New Post"
  end
end
