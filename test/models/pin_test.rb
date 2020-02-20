require 'test_helper'

class PinTest < ActiveSupport::TestCase
  test 'Create new pin' do
    pin = Pin.new user: User.new,
                  title: 'This is a title for idea'
    pin.save!

    assert_equal Pin.first, pin
    assert_equal Pin.all.length, 1
  end

  test 'validation for pin without a title' do
    pin = Pin.new user: User.new
    refute pin.valid?
  end

  test 'Validation for tag too long' do
    pin = Pin.new user: User.new,
                  title: 'This is a title for idea',
                  tag: 'This is a very long description of the pin I want to create'
    refute pin.valid?
  end
end
