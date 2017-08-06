class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :name
      t.string :brand
      t.string :model
      t.string :sku
      t.decimal :price, precision: 20, scale: 2
      t.text :desc
      t.timestamps null: false
    end
  end
end
