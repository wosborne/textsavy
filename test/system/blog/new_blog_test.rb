require "application_system_test_case"

class NewBlogTest < ApplicationSystemTestCase
  test "redirects to root if a blog already exists" do
    sign_in_as(users(:one))

    assert_current_path root_path

    visit new_blog_path

    assert_current_path root_path
  end
end
