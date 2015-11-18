require 'csv'

market_array = CSV.read("./seed_csvs/markets.csv")

market_array.each do |line|
  Market.create(
  name: line[1],
  address: line[2],
  city: line[3],
  county: line[4],
  state: line[5],
  zip: line[6]
  )
end

# vendor_array = CSV.read("./seed)csvs/vendors.csvs")
