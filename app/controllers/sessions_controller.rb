class SessionsController < ApplicationController

  skip_before_filter :login_required, only: [:new, :create, :destroy]
  skip_before_filter  :verify_authenticity_token, only: [:destroy]

  def new
    redirect_to '/' if current_user.present?
  end

  def create
    email = params[:email]
    password = params[:password]
    current_user = User.first#User.authenticate(email, password)
    if current_user.present?
      cookies[:auth_token] = { value: current_user.auth_token, expires: Time.now + 1.hour } 
      redirect_to '/'
    else
      flash[:error] = I18n.t('.wrong_credentials')
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
