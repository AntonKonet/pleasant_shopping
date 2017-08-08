class UsersController < ApplicationController

  def new
    invitation = Invitation.where(key: params[:key]).first
    if invitation.blank? || invitation.status == 'completed'
      flash[:error] = I18n.t('.invitation_not_valid')
      redirect_to '/'
    end
    @user = User.new(first_name: invitation.first_name, last_name: invitation.last_name, email: invitation.email)
  end

  def create
    user = User.new(params[:user])
  end

end
