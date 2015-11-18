require 'csv'

class AddMarketCsvData < ActiveRecord::Migration
  def change
    add_column :markets, :temp, :integer

    csv = File.read('./seed_csvs/markets.csv')
    csv = CSV.parse(csv)
    csv.each do |row|
      temp, name, address, city, country, state, zip = row
      Market.create(temp: temp, name: name, address: address, city: city, country: country, state: state, zip: zip)
    end
  end
end
