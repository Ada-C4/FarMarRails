class ChangeColumnDatatypeToDatetime < ActiveRecord::Migration
  def change
  	change_table :sales do |t|
	  	remove_column :sales, :purchase_time
	  	add_column :sales, :purchase_time, :datetime
	  end
  end
end
