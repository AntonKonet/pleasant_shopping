class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :created_at
      t.string :status
      t.integer :address_id
    end
  end
end
