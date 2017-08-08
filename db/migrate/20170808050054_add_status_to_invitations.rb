class AddStatusToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :status, :string, default: 'new'
    add_column :invitations, :user_id, :integer
  end
end
