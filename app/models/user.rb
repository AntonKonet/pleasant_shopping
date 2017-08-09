class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  validates_confirmation_of :password

  has_one :invitation

  before_save :encrypt_password
  before_create :generate_auth_token
  after_create :complete_invitation

  cattr_accessor :current_user

  attr_accessor :password, :password_confirmation

  def self.authenticate(email, password)
    user = where(email: email).first
    user.present? && user.authenticate(password) ? user : nil
  end

  def authenticate password
    crypted_password == encrypt(password)
  end

protected

  def encrypt_password
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--") if new_record?
    self.crypted_password = encrypt password
  end

  def encrypt password
     Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  def complete_invitation
    self.invitation.update_attributes(status: 'completed')
  end

  def generate_auth_token
    self.auth_token = SecureRandom.hex(20)
  end

end
