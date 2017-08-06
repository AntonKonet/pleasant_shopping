class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :crypted_password, limit: 40
      t.string :salt, limit: 40
      t.timestamps null: false
    end
  end
end
