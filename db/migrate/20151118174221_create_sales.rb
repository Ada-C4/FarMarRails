class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :amount
      t.datetime :purchase_time
      t.integer :vendor_id
      t.integer :product_id

      t.timestamps null: false
    end
    add_index :sales, :vendor_id
    add_index :sales, :product_id
  end
end
