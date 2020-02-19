require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'Form to create user' do
    visit new_user_path
    fill_in 'Email', with: 'happy@home.ch'
    click_on 'Log in', match: :first

    assert_equal User.all.length, 1
    assert_equal User.all.first.email, 'happy@home.ch'
    assert_equal current_path, root_path
  end

  test 'Form requires email' do
    visit new_user_path
    click_on 'Log in', match: :first

    assert_equal User.all.length, 0
    assert page.has_content? "Email can't be blank"
  end
end
