require "application_system_test_case"

class Login < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "can login" do
    visit login_url

    fill_in "Name", with: @user.name
    fill_in "Password", with: 'secret'

    click_on 'Login'

    assert_text 'Welcome'
  end
end
