class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :employee_no
      t.integer :market_id

      t.timestamps null: false
    end
  end
end
