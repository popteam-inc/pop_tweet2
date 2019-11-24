class Api::AutofollowController < ApplicationController
  include TwitterActions
  before_action :get_userdata_initialize, :twitter_client

  def create
    # @account = @user.accounts.find_by(id: params[:id])
    if @account.autofollow.nil?
      # @account.autofollow.build(autofollow_params)
      @autofollow = @account.build_autofollow(create_params)
      @autofollow.save
      render json: @account.autofollow
    else
      @account.autofollow.update(create_params)
      render json: @account.autofollow
    end
  end
 
    # def getautocommentlike
    #   # @user = User.find_by(rid: params[:rid])
    #   @account = @user.accounts.find_by(id: params[:id])
    #   render json: @account.autofollow
    # end

  private

  def create_params
    params.require(:autofollow).permit!
  end
end