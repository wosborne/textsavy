require "application_system_test_case"

class ViewPostTest < ApplicationSystemTestCase
  test "authenticated user can see edit button" do
    sign_in_as(users(:one))

    click_on "A Live Post"

    assert_link "Edit"
  end

  test "unauthenticated user cannot see edit button" do
    visit root_url

    click_on "A Live Post"

    assert_no_link "Edit"
  end

  test "authenticated user can visit archived post" do
    sign_in_as(users(:one))

    click_on "An Archived Post"

    assert_link "Edit"
    assert_selector ".tag", text: "Archived"
    assert_current_path post_path((posts(:archived)))
  end

  test "unauthenticated user is redirected to root when visiting archived post" do
    visit post_path(posts(:archived))

    assert_current_path new_session_path
  end
end