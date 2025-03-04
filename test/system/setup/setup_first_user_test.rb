require "application_system_test_case"

class SetupFirstUserTest < ApplicationSystemTestCase
  test "redirect to initial user setup when no users exist" do
    User.destroy_all

    visit root_path

    assert_current_path new_setup_path
  end
end