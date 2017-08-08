class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  has_one :invitation

  after_create :complete_invitation

protected

  def complete_invitation
    self.invitation.update_attributes(status: 'completed')
  end

end
