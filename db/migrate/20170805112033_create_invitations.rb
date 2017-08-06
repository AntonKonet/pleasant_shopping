class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|

      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :key
      t.timestamps null: false
    end
  end
end
