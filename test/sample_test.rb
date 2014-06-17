require 'minitest/autorun'
ENV['RACK_ENV'] = 'test'

require '../lib/quickapps_feedback'
require 'capybara'
require 'capybara/dsl'

describe 'test' do
  include Capybara::DSL
  # Capybara.default_driver = :selenium # <-- use Selenium driver

  def setup
    Capybara.app = QuickappsFeedback::App.new
  end

  def test_it_works
    visit '/feedback'
    assert page.has_content?('feedback here')
  end
end
