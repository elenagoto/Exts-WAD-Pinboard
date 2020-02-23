require "application_system_test_case"

class PinsTest < ApplicationSystemTestCase
  test 'create new pin' do
    visit new_user_path
    fill_in 'Email', with: 'happy@home.ch'
    click_on 'Log in', match: :first

    visit new_pin_path
    fill_in 'Title', with: 'Default pin title'
    fill_in 'Image url', with: 'https://static.boredpanda.com/blog/wp-content/uploads/2015/05/animal-origami-paper-art-hoang-tien-quyet-1-1.jpg'
    click_on 'Create', match: :first
    find('.card').hover
    assert page.has_content? 'Default pin title'
  end

  test 'pins are loaded in the index' do
    3.times do |i|
      pin = Pin.new title: "Default title for pin # #{i + 1}",
                    image_url: 'https://static.boredpanda.com/blog/wp-content/uploads/2015/05/animal-origami-paper-art-hoang-tien-quyet-1-1.jpg',
                    user: User.new
      pin.save!
    end

    visit root_path
    Capybara.ignore_hidden_elements = false
    assert page.has_content?('Default title for pin # 1')
    assert page.has_content?('Default title for pin # 2')
    assert page.has_content?('Default title for pin # 3')
    Capybara.ignore_hidden_elements = true
  end

  test 'only most recent pins are loaded in the index' do
    8.times do |i|
      pin = Pin.new title: "Default title for pin # #{i + 1}",
                    image_url: 'https://static.boredpanda.com/blog/wp-content/uploads/2015/05/animal-origami-paper-art-hoang-tien-quyet-1-1.jpg',
                    user: User.new
      pin.save!
    end

    visit root_path
    Capybara.ignore_hidden_elements = false
    assert page.has_content?('Default title for pin # 4')
    assert page.has_content?('Default title for pin # 6')
    assert page.has_content?('Default title for pin # 8')
    refute page.has_content?('Default title for pin # 1')
    Capybara.ignore_hidden_elements = true
  end

  test 'validation for pin without a title' do
    visit new_user_path
    fill_in 'Email', with: 'happy@home.ch'
    click_on 'Log in', match: :first

    visit new_pin_path
    click_on 'Create', match: :first

    assert page.has_content? "Title can't be blank"
  end

  test 'validation for pin with tag too long' do
    visit new_user_path
    fill_in 'Email', with: 'happy@home.ch'
    click_on 'Log in', match: :first

    visit new_pin_path
    fill_in 'Title', with: 'Default pin title'
    fill_in 'Tag', with: 'This is a very long tag that I want to use'
    click_on 'Create', match: :first

    assert page.has_content? 'Tag is too long (maximum is 30 characters)'
  end

  test 'search form' do
    pin = Pin.new user: User.new,
                  title: 'Sunflowers from van Gogh',
                  tag: 'Impressionism, Oil painting'
    pin.save!

    pin_two = Pin.new user: User.new,
                      title: 'Origami Fox',
                      tag: 'Tomoko Fuse, Animal'
    pin_two.save!

    visit root_path
    fill_in 'q', with: 'Fox'
    click_on 'Search', match: :first

    assert_equal current_path, pins_path

    find('.card').hover
    assert page.has_content? 'Origami Fox'

    find('.card').hover
    refute page.has_content? 'Sunflowers from van Gogh'
  end

  test 'Edit pin is working' do
    user = User.new email: 'happy@home.ch'
    pin = Pin.new title: 'Unedited pin', user: user
    pin.save!

    visit new_user_path
    fill_in 'Email', with: 'happy@home.ch'
    click_on 'Log in', match: :first

    visit pins_path
    find('.card').hover
    assert page.has_content? 'Unedited pin'

    visit edit_pin_path(pin)
    fill_in 'Title', with: 'This is a better title'
    fill_in 'Tag', with: 'Test, Edit'
    click_on 'Update', match: :first

    visit pins_path
    find('.card').hover
    assert page.has_content? 'This is a better title'
    assert page.has_content? 'Test, Edit'
  end
end
