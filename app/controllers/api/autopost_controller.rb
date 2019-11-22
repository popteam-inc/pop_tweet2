class Api::AutopostController < ApplicationController
  # before_action :twitter_client

  def test_initialize
    @user = User.first
    @account = @user.accounts.first
  end

  # def twitter_client
  #   @client = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = ENV['API_KEY']
  #     config.consumer_secret     = ENV['API_SECRET_KEY']
  #     config.access_token        = @account.token
  #     config.access_token_secret = @account.secret
  #   end
  # end

  def create
    test_initialize
    # @autopost = @account.build_autopost(create_params)
    @autopost = @account.autoposts.build(create_params)
    @autopost.save
    # @autopost = Autopost.create(create_params)
    render json: @autopost
  end

  # def post
  #   @tweet = ReservationTweet.find_by(id: params[:id])
  #   if @tweet.filename = nil?
  #     caption = @tweet.autopost_caption
  #     @client.update(caption)
  #   else
  #     caption = @tweet.autopost_caption
  #     media = open(@tweet.filename)
  #     @client.update_with_media(caption, media)
  #   end
  #   render json: @tweet
  # end

  private

  def create_params
    # params.require(:autopost).permit(:autopost_caption, :filename, :autopost_date)
    params.require(:autopost).permit!
  end
end
  