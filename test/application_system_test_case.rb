require "test_helper"
require "action_text/system_test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include ActionText::SystemTestHelper
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]

  def sign_in_as(user)
    visit new_session_url

    fill_in "email_address", with: users(:one).email_address
    fill_in "password", with: "password"

    click_on "Sign in"
  end
end
