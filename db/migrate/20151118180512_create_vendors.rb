class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :num_employees
      t.string :name
      t.integer :market_id

      t.timestamps null: false
    end
  end
end
