class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.where(email: params[:invitation][:email]).first
    if @invitation.present?
      flash[:error] = I18n.t('.email_has_already_been_taken')
      render :new
    end
    data = params.require(:invitation).permit(:first_name, :last_name, :email)
    @invitation = Invitation.new(data)
    if @invitation.valid?
      @invitation.save
      flash[:notice] = I18n.t('.request_has_been_accepted')
      redirect_to '/'
    else
      flash[:error] = I18n.t('.fill_all_the_fields')
      render :new
    end
  end

end
