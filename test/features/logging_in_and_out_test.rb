class LoggingInAndOutTest < ActionDispatch::IntegrationTest
# Logging in and out
#   I already have a user in the database
  def test_i_can_log_in_and_out
    # I go to "/"
    # and click "login"
    page.visit root_path
    page.click_link('Login')

    # I enter my username and password
    # I am back on "/" and see "welcome, Josh" and "logout", but not "login"
    # I click "logout"
    # and am back on "/" and see "login", but not "logout"
