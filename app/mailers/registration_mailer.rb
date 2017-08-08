class RegistrationMailer < ApplicationMailer

  def send_register_link invitation
    @first_name, @last_name = invitation.first_name, invitation.last_name
    @url = invitation.build_url
    mail(to: invitation.email, subject: "Complete your registration process").deliver
  end

end
