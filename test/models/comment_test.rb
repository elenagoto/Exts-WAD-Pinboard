require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Changing the associated Pin for a Comment' do
    user = User.new email: 'happy@home.ch'
    user.save!

    pin = Pin.new title: 'This is a title for pin',
                  user: User.new
    pin.save!

    comment = Comment.new body: 'This is a beautiful image',
                          pin: pin,
                          user: user
    comment.save!

    pin_two = Pin.new title: 'This is a title for another pin',
                      user: user
    pin_two.save!

    comment.pin = pin_two
    comment.save!

    assert_equal Comment.first.pin, pin_two
  end

  test 'cascading save' do
    user = User.new email: 'happy@home.ch'
    user.save!

    pin = Pin.new title: 'This is a title for another pin',
                  user: user
    comment = Comment.new body: 'This is a beautiful image',
                          user: user
    pin.comments << comment
    pin.save!

    assert_equal Comment.first, comment
  end
end
