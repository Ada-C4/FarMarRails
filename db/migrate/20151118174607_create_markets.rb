class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.string :state
      t.string :zip
      t.string :address
      t.string :county
      t.string :city

      t.timestamps null: false
    end
  end
end
