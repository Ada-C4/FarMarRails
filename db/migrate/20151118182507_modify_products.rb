class ModifyProducts < ActiveRecord::Migration
  def change
    add_index :products, :vendor_id
  end
end
