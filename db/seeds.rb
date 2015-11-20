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

product_array = CSV.read("./seed_csvs/products.csv")
product_array.each do |line|
  Product.create(
    name: line[1],
    vendor_id: line[2].to_i
  )
end

sales_array = CSV.read("./seed_csvs/sales.csv")
sales_array.each do |line|
  Sale.create(
    amount: line[1].to_i,
    purchase_time: line[2].to_datetime,
    vendor_id: line[3].to_i,
    product_id: line[4].to_i
  )
end


Sale.create (
  {amount: 1000,
  purchase_time: Time.now,
  vendor_id: 1,
  product_id: 1}
)

Sale.create (
  {amount: 1000,
  purchase_time: Time.now,
  vendor_id: 2,
  product_id: 3}
)
