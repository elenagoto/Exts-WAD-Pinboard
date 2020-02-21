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
                  tag: 'This is a very long description of the pin'
    refute pin.valid?
  end

  test 'most recent method no records' do
    assert_empty Pin.most_recent
  end

  test 'most recent method 2 records' do
    pin_one = Pin.new user: User.new,
                    title: "Beautiful pin 1"
    pin_one.save!

    pin_two = Pin.new user: User.new,
                    title: "Beautiful pin 2"
    pin_two.save!

    assert_equal Pin.most_recent.length, 2
    assert_equal Pin.most_recent.first, pin_two
  end

  test 'most recent method 8 records' do
    8.times do |i|
      pin = Pin.new user: User.new,
                      title: "Beautiful pin #{i + 1}"
      pin.save!
    end

    assert_equal Idea.most_recent.length, 6
    assert_equal Idea.most_recent.first.title, 'Beautiful pin 8'
  end
end
