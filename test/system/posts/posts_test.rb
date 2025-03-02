require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "unauthenticated users only see live posts" do
    visit root_url

    assert_selector "h1", text: "Blog"

    assert_text "A Live Post"
    assert_text "In a million stars!"

    assert_no_text "An Archived Post"
    assert_no_text "I've been archived!"
  end

  test "authenticated user see's all posts" do
    sign_in_as(users(:one))

    assert_selector "h1", text: "Blog"

    assert_text "A Live Post"
    assert_text "In a million stars!"

    assert_text "An Archived Post"
    assert_text "I've been archived!"
  end
end
