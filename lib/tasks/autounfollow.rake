namespace :autounfollow do
  task :tweet => :environment do
      @autounfollows =  Autounfollow.all
      @autounfollows.each do |autounfollow|
        @account = autounfollow.account
        twitter_client(@account)
        # query = autounfollow.keyword
        # results = @client.search(query, count: 10, result_type: "recent",  exclude: "retweets", filter: "images")
        # results.take(3).each do |tw|
        #   @client.favorite(tw.id)
        # end
        friends = @client.friend_ids(@account.user_name)
        friends.attrs[:ids].take(30).each do |fr|
          # プロフィール写真があるか
          if @client.user(fr).default_profile_image?
            # なかったらフォロー解除
            @client.unfollow(fr)
          else
          end
        end
      end
    end
  end

def twitter_client(account)
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['API_KEY']
    config.consumer_secret     = ENV['API_SECRET_KEY']
    config.access_token        = account.token
    config.access_token_secret = account.secret
  end
end