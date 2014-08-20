require 'minitest/autorun'
ENV['RACK_ENV'] = 'test'

require '../lib/quickapps_feedback'
require 'capybara'
require 'capybara/dsl'

describe 'test' do
  include Capybara::DSL

  def setup
    Capybara.app = QuickappsFeedback::App.new
  end

  def test_it_works
    add_headers('X_MXIT_USERID_R' => 'm40228998002')
    visit '/feedback'
    click_link('support')
    fill_in 'feedback_full_message', with: 'I have a support issue for you'
    click_button 'send'
    assert page.has_css?('div.alert-info')
  end

  def add_headers(headers)
    headers.each do |name, value|
      page.driver.browser.header(name, value)
    end
  end
end
