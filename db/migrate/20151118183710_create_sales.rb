class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :purchase_time
      t.integer :amount
      t.integer :vendor_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
