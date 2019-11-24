module TwitterActions
    extend ActiveSupport::Concern
  
    included do
    end

    def get_userdata_initialize
        @user = User.first
        @account = @user.accounts.first
    end
  
    def twitter_client
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV['API_KEY']
            config.consumer_secret     = ENV['API_SECRET_KEY']
            config.access_token        = @account.token
            config.access_token_secret = @account.secret
        end
    end

    def twitter_call(account)
        return @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV['API_KEY']
            config.consumer_secret     = ENV['API_SECRET_KEY']
            config.access_token        = account.token
            config.access_token_secret = account.secret
        end
    end

    module_function :twitter_call
  
    private
  
end