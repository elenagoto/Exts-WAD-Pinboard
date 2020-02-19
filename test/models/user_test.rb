require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Create new user' do
    user = User.new email: 'happy@home.ch'
    user.save!

    assert_equal User.first, user
    assert_equal User.all.length, 1
  end

  test 'Email is required' do
    user = User.new
    refute user.valid?
  end
end
