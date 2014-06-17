require 'quickapps_feedback/version'
require 'sinatra/base'

module QuickappsFeedback
  # Your code goes here...
  class App < Sinatra::Application
    get '/feedback' do
      'feedback here'
    end
  end
end
