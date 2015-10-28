class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in!(user)
    @current_user = user
    session[:token] = user.session_token
  end

  def sign_out!
    session[:token] = nil
  end

  def register!(response)
    @user = User.new
    @user.full_name = response.user.full_name
    @user.uid = response.user.id
    @user.profile_pic = response.user.profile_picture
    @user.username = response.user.username
    @user.session_token = response.access_token

    if @user.save
      sign_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end
end
