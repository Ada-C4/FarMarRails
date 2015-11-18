class ModifySales < ActiveRecord::Migration
  def change
    add_index :sales, :vendor_id
    add_index :sales, :product_id
  end
end
