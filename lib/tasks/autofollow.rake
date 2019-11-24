namespace :autofollow do
  desc 'Twitterの自動フォロー'
  task :tweet => :environment do

    @autofollows =  Autofollow.all
    @autofollows.each do |autofollow|
      @account = autofollow.account
      @client = TwitterActions.twitter_call(@account)
      # twitter_client(@account)
      query = autofollow.keyword
      results = @client.search(query, count: 10, result_type: "recent",  exclude: "retweets", filter: "")
      results.take(3).each do |tw|
        @client.follow(tw.user.id)
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
