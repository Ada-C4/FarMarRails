require 'csv'

market_array = CSV.read("./seed_csvs/markets.csv")

market_array.each do |line|
  Market.create(
  name: line[0],
  address: line[1],
  city: line[2],
  county: line[3],
  state: line[4],
  zip: line[5]
  )
end

vendor_array = CSV.read("./seed)csvs/vendors.csv")
