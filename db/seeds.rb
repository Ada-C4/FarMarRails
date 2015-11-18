require 'csv'

seed_markets = []

CSV.foreach(./seed_csvs/markets.csv) do |row|
  row_hash = {
  name: row[0],
  address: row[1],
  city: row[2],
  county: row[3],
  state: row[4],
  zip: row[5]
  }

  seed_markets << row_hash
end



seed_markets.each do |seed|
  Market.create(seed)
end
