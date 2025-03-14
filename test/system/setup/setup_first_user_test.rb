require "application_system_test_case"

class SetupFirstUserTest < ApplicationSystemTestCase
  test "redirects to create first user and blog on intial load" do
    User.destroy_all
    Blog.destroy_all

    visit root_path

    assert_current_path new_setup_path

    assert_selector "h1", text: "Create your administrative user"

    fill_in "Email address", with: "test@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Create User"

    assert_selector "h1", text: "Name and describe your blog"
    assert_current_path new_blog_path

    fill_in "Title", with: "My Blog"
    fill_in "Description", with: "My blog description"

    click_on "Create Blog"

    assert_current_path root_path
    assert_text "New post"
  end

  test "does not redirect if user already exists" do
    visit root_path

    assert_current_path root_path
    assert_no_text "New post"
    assert_text "Blog"
  end

  test "returns errors password doesn't match" do
    User.destroy_all

    visit root_path

    fill_in "Email address", with: "test@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password-unmatched"

    click_on "Create User"

    assert_current_path new_setup_path
    assert_text "Password confirmation doesn't match Password"
  end
end
