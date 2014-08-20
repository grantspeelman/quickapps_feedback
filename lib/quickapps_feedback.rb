require 'quickapps_feedback/version'
require 'quickapps_feedback/feedback'
require 'quickapps_feedback/send_feedback_to_uservoice'
require 'sinatra/base'

module QuickappsFeedback
  class App < Sinatra::Base
    def flash
      request.flash
    end

    get '/feedback' do
      erb :index
    end

    post '/feedback' do
      feedback = Feedback.new(request.env['HTTP_X_MXIT_USERID_R'] || session[:uid],
                              params[:full_message],params[:support_type])
      SendFeedbackToUservoice.new.perform(feedback)
      flash[:notice] = 'thank you for your feedback'
      redirect to('/')
    end

    get '/feedback/new' do
      erb :new, locals: {support_type: params[:type]}
    end
  end
end
