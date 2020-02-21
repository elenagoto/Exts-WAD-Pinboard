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
    5.times do |i|
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
end
