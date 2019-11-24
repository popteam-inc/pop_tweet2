class Api::AutolikeController < ApplicationController
  include TwitterActions
  before_action :get_userdata_initialize, :twitter_client

  def create
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
    params.require(:autolike).permit!
  end
end