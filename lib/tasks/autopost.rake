namespace :autopost do
  task :tweet => :environment do
    @currentDate = `date +"%M %k %d %m *"`.chomp
    if Autopost.where(autopost_date: @currentDate)
      @autoposts = Autopost.where(autopost_date: @currentDate)
      @autoposts.each do |autopost|
        @account = autopost.account
        twitter_client(@account)
        caption = autopost.autopost_caption
        # 分岐
        @images = [autopost.image1, autopost.image2, autopost.image3, autopost.image4].reject(&:blank?)
        if @images.empty?
          @client.update(caption)
        else
          images = @images.map { |image| open(image) }
          @client.update_with_media(caption, images)
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
