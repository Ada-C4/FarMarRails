class FixPurchaseTime < ActiveRecord::Migration
  def change
    change_column :sales, :purchase_time, :string
  end
end
