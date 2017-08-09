class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_user
  before_filter :login_required

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first || User.where(auth_token: cookies[:auth_token]).first
  end

  def current_user=(user)
    session[:user_id] = user if user
    @current_user = user || false
  end

protected

  def set_current_user
    User.current_user = self.send(:current_user)
  end

  def login_required
    current_user.present?
  end
end
