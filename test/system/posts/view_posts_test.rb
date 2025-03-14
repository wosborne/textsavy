require "application_system_test_case"

class ViewPostsTest < ApplicationSystemTestCase
  test "authenticated user see's all posts" do
    sign_in_as(users(:one))

    assert_text "A Live Post"
    assert_text "In a million stars!"

    assert_text "An Archived Post"
    assert_text "I've been archived!"
  end

  test "unauthenticated users only see live posts" do
    visit root_url

    assert_text "A Live Post"
    assert_text "In a million stars!"

    assert_no_text "An Archived Post"
    assert_no_text "I've been archived!"
  end

  test "authenticated users can filter posts" do
    sign_in_as(users(:one))

    assert_text "A Live Post"
    assert_text "An Archived Post"

    assert_link "All", href: root_path

    click_on "Live"

    assert_text "A Live Post"
    assert_no_text "An Archived Post"

    click_on "Archive"

    assert_no_text "A Live Post"
    assert_text "An Archived Post"
  end

  test "unauthenticated users can't see post filters" do
    visit root_url

    assert_no_link "All", href: root_path
    assert_no_selector ".button", text: "Live"
    assert_no_link "Archive"
  end

  test "unauthenticated users can't see New post button" do
    visit root_url

    assert_selector "h1", text: "Blog"

    assert_no_link "New post"
  end
end
