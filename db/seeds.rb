require 'csv'

seed_markets = []

CSV.foreach('./seed_csvs/markets.csv') do |row|
  row_hash = {
  name: row[1],
  address: row[2],
  city: row[3],
  county: row[4],
  state: row[5],
  zip: row[6]
  }

  seed_markets << row_hash
end

seed_markets.each do |seed|
  Market.create(seed)
end
################
seed_vendors = []

CSV.foreach('./seed_csvs/vendors.csv') do |row|
  row_hash = {
    name: row[1],
    employees: row[2],
    market_id: row[3]
  }

  seed_vendors << row_hash
end

seed_vendors.each do |seed|
  Vendor.create(seed)
end
##################
seed_products = []

CSV.foreach('./seed_csvs/products.csv') do |row|
  row_hash = {
    name: row[1],
    vendor_id: row[2],
  }

  seed_products << row_hash
end

seed_products.each do |seed|
  Product.create(seed)
end
#################
seed_sales = []

CSV.foreach('./seed_csvs/sales.csv') do |row|
  row_hash = {
    amount: row[1],
    purchase_time: row[2],
    vendor_id: row[3],
    product_id: row[4]
  }

  seed_sales << row_hash
end

seed_sales.each do |seed|
  Sale.create(seed)
end
