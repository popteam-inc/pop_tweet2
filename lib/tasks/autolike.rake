namespace :autolike do
  desc 'Twitterの自動いいね'
  task :tweet => :environment do
    
    @autolikes =  Autolike.all
    @autolikes.each do |autolike|
      @account = autolike.account
      # twitter_client(@account)
      @client = TwitterActions.twitter_call(@account)
      query = 'test'
      results = @client.search(query, count: 10, result_type: "recent",  exclude: "retweets", filter: "images")
      results.take(3).each do |tw|
        @client.favorite(tw.id)
      end
    end
  end
end

# def twitter_client(account)
#   @client = Twitter::REST::Client.new do |config|
#     config.consumer_key        = ENV['API_KEY']
#     config.consumer_secret     = ENV['API_SECRET_KEY']
#     config.access_token        = account.token
#     config.access_token_secret = account.secret
#   end
# end
