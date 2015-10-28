class SessionsController < ApplicationController
  def create
    response = Instagram.get_access_token(params[:code], :redirect_uri => "http://localhost:3000/users/auth/instagram/callback")

    @user = User.find_by(uid: response.user.id)
    if @user
      sign_in!(@user)
      redirect_to root_url
    else
      register!(response)
    end
  end

  def destroy
    sign_out!
    redirect_to root_url
  end
end
