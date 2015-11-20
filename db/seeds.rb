# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

markets = []
CSV.read("seed_csvs/markets.csv").each do |market|
  market_hash = {
    name: market[1],
    address: market[2],
    city: market[3],
    county: market[4],
    state: market[5],
    zip: market[6]
  }
  markets.push(market_hash)
end

markets.each do |market|
  Market.create(market)
end


vendors = []
CSV.read("seed_csvs/vendors.csv").each do |vendor|
  vendor_hash = {
    name: vendor[1],
    num_employees: vendor[2].to_i,
    market_id: vendor[3].to_i,
  }
  vendors.push(vendor_hash)
end

vendors.each do |vendor|
  Vendor.create(vendor)
end

products = []
CSV.read("seed_csvs/products.csv").each do |product|
  product_hash = {
    name: product[1],
    vendor_id: product[2].to_i,
  }
  products.push(product_hash)
end

products.each do |product|
  Product.create(product)
end

sales = []
CSV.read("seed_csvs/sales.csv").each do |sale|
  sale_hash = {
    amount: sale[1].to_i,
    purchase_time: sale[2].to_datetime,
    vendor_id: sale[3].to_i,
    product_id: sale[4].to_i
  }
  sales.push(sale_hash)
end

sales.each do |sale|
  Sale.create(sale)
end
