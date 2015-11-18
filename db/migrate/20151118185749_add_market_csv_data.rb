class AddMarketCsvData < ActiveRecord::Migration
  def change
    csv = File.read('/seed_csvs/markets.csv')
    csv.each do |line|
      Market.create(row.to_hash)
    end
  end
end
