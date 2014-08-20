require 'excon'

module QuickappsFeedback
  class Feedback
    attr_reader :uid, :subject, :message, :support_type

    def initialize(uid,full_message,support_type)
      @uid = uid
      @subject, @message = full_message.split(':',2)
      @message ||= @subject
      @support_type = support_type
    end

    def user_account
      return @user_account if @user_account
      connection = Excon.new(ENV['USER_ACCOUNT_API'])
      result = connection.get(path: '/api/user_accounts',
                              headers: {'X-API-Token' => ENV['USER_ACCOUNT_API_KEY'] },
                              query: {uid: uid,
                                      provider: 'mxit'},
                              :expects => 200)
      @user_account = JSON.parse(result.body).first
    end

    def user_email
      user_account['email']
    end

    def user_real_name
      user_account['real_name']
    end
  end
end
