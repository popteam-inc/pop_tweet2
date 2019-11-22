class SessionsController < ApplicationController
  before_action :login_required, only: [:destroy]

  def create
    account = Account.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = account.uid
    redirect_to root_path
  end

  def callback
    auth = request.env['omniauth.auth']
    @account = Account.find_by(uid: auth["uid"])
    if @account.nil? then
      @user = User.first
      @account = @user.accounts.build()
      @account.uid = auth['uid']
      @account.image_url = auth['info']['image']
      @account.user_name = auth["info"]["nickname"]
      # この辺の情報は暗号化して保存したほうがいいかも（まだ未実装）
      @account.token = auth['credentials']['token']
      @account.secret = auth['credentials']['secret']
      @account.save
      render json: @account
    else
      render json: @account
    end
    session[:user_id] = @account.id
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  # private

  # def twitter_client(current_user)
  #   Twitter.configure do |config|
  #     config.consumer_key       = ENV["API_KEY"]
  #     config.consumer_secret    = ENV["API_SECRET"]
  #     config.oauth_token        = current_user.token
  #     config.oauth_token_secret = current_user.secret
  #   end
  # end

  # def create
  #     user = User.find_or_create_from_auth(request.env['omniauth.auth'])
  #     session[:user_id] = user.uid
  #     flash[:notice] = "ユーザ認証が完了しました。"
  #     redirect_to root_path
  # end

  # def destroy
  #     reset_session
  #     flash[:notice] = "ログアウトしました。"
  #     redirect_to root_path
  # end
end