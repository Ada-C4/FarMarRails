class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.string :string,
      t.string :address
      t.string :string,
      t.string :city
      t.string :string,
      t.string :county
      t.string :string,
      t.string :state
      t.string :string,
      t.string :zip
      t.string :string

      t.timestamps null: false
    end
  end
end
