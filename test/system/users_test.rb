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

  test 'user can see My Pins when logged' do
    visit root_path
    assert page.has_content? 'Login/Register'
    click_on 'Login/Register', match: :first

    fill_in 'Email', with: 'happy@home.ch'
    click_on 'Log in', match: :first

    assert page.has_content? 'My Pins'
    refute page.has_content? 'Login/Register'
  end

  test 'users can edit pins when logged' do
    user = User.new email: 'happy@home.ch'
    pin = Pin.new title: 'Unedited pin', user: user
    pin.save!

    visit pin_path(pin)
    refute page.has_content? 'Edit'

    click_on 'Login/Register', match: :first
    fill_in 'Email', with: user.email
    click_on 'Log in', match: :first

    visit pin_path(pin)
    assert page.has_content? 'edit'
  end
end
