class Api::AutolikeController < ApplicationController
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
    # @account = @user.accounts.find_by(id: params[:id])
    if @account.autolike.nil?
      # @account.autolike.build(autolike_params)
      @autolike = @account.build_autolike(create_params)
      @autolike.save
      render json: @account.autolike
    else
      @account.autolike.update(create_params)
      render json: @account.autolike
    end
  end

    # def getautocommentlike
    #   # @user = User.find_by(rid: params[:rid])
    #   @account = @user.accounts.find_by(id: params[:id])
    #   render json: @account.autolike
    # end

  private

  def create_params
    params.require(:autolike).permit(:keyword)
  end
end