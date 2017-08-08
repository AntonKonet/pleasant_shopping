class Invitation < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  belongs_to :user

  after_initialize :generate_key
  after_create :send_invite_email

  def build_url
    "http://127.0.0.1:3000/sign_up/#{key}"
  end

protected

  def generate_key
    self.key = SecureRandom.hex(20)
  end

  def send_invite_email
    RegistrationMailer.send_register_link(self).deliver
    #in real life here must be redis + rescue with background sending
  end

end
