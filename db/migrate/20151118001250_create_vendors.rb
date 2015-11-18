class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :string,
      t.string :num_emps
      t.string :fixnum,
      t.string :market_id
      t.string :fixnum

      t.timestamps null: false
    end
  end
end
