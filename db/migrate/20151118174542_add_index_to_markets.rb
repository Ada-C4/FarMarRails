class AddIndexToMarkets < ActiveRecord::Migration
  def change
    add_index :vendors, :market_id
  end
end
