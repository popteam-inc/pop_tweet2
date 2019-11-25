class Api::AutopostController < ApplicationController
  include TwitterActions
  before_action :get_userdata_initialize, :twitter_client

  def create
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
  