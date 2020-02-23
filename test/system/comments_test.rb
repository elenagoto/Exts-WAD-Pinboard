require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  test 'adding a Comment to a Pin' do
    user = User.new email: 'happy@home.ch'
    user.save!

    pin = Pin.new title: 'This is Pin title', user: user
    pin.save!

    visit new_user_path
    fill_in 'Email', with: user.email
    click_on 'Log in', match: :first

    visit pin_path(pin)
    fill_in 'Add a comment', with: 'Beautiful image'
    click_on 'Post'

    assert_equal current_path, pin_path(pin)
    assert page.has_content? 'Beautiful image'
  end

  test 'comments cannot be added when not logged in' do
    pin = Pin.new title: 'This is Pin title', user: User.new
    pin.save!

    visit pin_path(pin)
    refute page.has_content? 'Add a comment'
  end
end
