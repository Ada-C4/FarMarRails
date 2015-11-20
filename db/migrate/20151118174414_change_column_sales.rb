class ChangeColumnSales < ActiveRecord::Migration
  def change
    change_column :sales, :purchase_time, :datetime
  end
end
