# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


CSV.read("./seed_csvs/markets.csv").each do |line|
  market = {name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]}
  Market.create market
end

CSV.read("./seed_csvs/vendors.csv").each do |line|
  vendor = {name: line[1], num_emps: line[2].to_i, market_id: line[3].to_i}
  Vendor.create vendor
end

CSV.read("./seed_csvs/products.csv").each do |line|
  product = {name: line[1], vendor_id: line[2].to_i}
  Product.create product
end

CSV.read("./seed_csvs/sales.csv").each do |line|
  sale = {amount: line[1].to_i, purchase_time: DateTime.strptime(line[2], "%Y-%m-%d %H:%M:%S %z") , vendor_id: line[3].to_i, product_id: line[4].to_i}
  Sale.create sale
end
