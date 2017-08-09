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
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = User.new(user_params)
    invitation = Invitation.where(email: @user.email).first
    invitation.user = @user
    if @user.valid?
      @user.save
      redirect_to login_path
    else
      flash[:error] = I18n.t('.registration_not_finished')
      render :new
    end
  end

end
