class Api::V1::LoginController < Api::V1::BaseController
  skip_before_action :authenticate_with_token, only: [:login]
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
  def wechat_params
   {
    appid: ENV["appid"],
    secret: ENV["secret"],
    js_code: params[:code],
    grant_type: "authorization_code" }
  end

  def wechat_user
    @wechat_response ||= RestClient.post( URL, wechat_params )
    @wechat_user ||= JSON.parse(@wechat_response.body)
    @wechat_user
  end

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    @user.authentication_token = SecureRandom.hex(16)
    @user.save!
    @user.update(nickname: user_params["nickName"], avatar_url: user_params["avatarUrl"])
    render json: {
      userId: @user.id,
      authenticationToken: @user.authentication_token,
      nickName: @user.nickname,
      avatarUrl: @user.avatar_url,
      openId: @user.open_id
      }
  end

  private

  def user_params
    params.require("userInfo").permit("nickName", "avatarUrl")
  end
end
