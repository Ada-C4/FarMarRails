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

vendor_array = CSV.read("./seed_csvs/vendors.csv")

vendor_array.each do |line|
  Vendor.create(
    name: line[1],
    employee_no: line[2].to_i,
    market_id: line[3].to_i
  )
end
