require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    assert_selector "h1", text: "Posts"
    assert_selector "h2", text: "My First Post"
    assert_selector "p", text: "It feels good to be read."
  end
end
