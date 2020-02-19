require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit '/'
    assert_selector 'h1', text: 'Add, pin and share your favorite images'
  end
end
