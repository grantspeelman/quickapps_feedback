require 'minitest/autorun'
require 'rack/test'
require '../lib/quickapps_feedback'

describe 'test' do
  include Rack::Test::Methods

  def app
    QuickappsFeedback::App
  end

  def test_hello_world
    get '/feedback'
    last_response.must_be(:ok?)
  end
end
