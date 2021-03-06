class Api::AutounfollowController < ApplicationController
  include TwitterClients
  before_action :get_userdata_initialize, :twitter_client

  def create

    # @account = @user.accounts.find_by(id: params[:id])
    if @account.autounfollow.nil?
      @autounfollow = @account.build_autounfollow(create_params)
      @autounfollow.save
      render json: @account.autounfollow
    else
      @account.autounfollow.update(create_params)
      render json: @account.autounfollow
    end
  end

    # def getautocommentlike
    #   # @user = User.find_by(rid: params[:rid])
    #   @account = @user.accounts.find_by(id: params[:id])
    #   render json: @account.autofollow
    # end

  private

  def create_params
    params.require(:autounfollow).permit!
  end
end