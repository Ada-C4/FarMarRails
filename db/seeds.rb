require 'csv'

csv_market = File. read ('./seed_csvs/markets.csv')
csv_market = CSV.parse(csv_market)
csv_market.each do |row|
  m= Market.new
  m.name = row[1]
  m.address = row[2]
  m.city = row[3]
  m.country = row[4]
  m.state = row[5]
  m.zip = row[6]
  m.save
end

csv_vendor = File.read('./seed_csvs/vendors.csv')
csv_vendor = CSV.parse(csv_vendor)
csv_vendor.each do |row|
  v= Vendor.new
  v.name = row[1]
  v.no_of_employees = row[2]
  v.market_id = row[3]
  v.save
end

csv_product = File.read('./seed_csvs/products.csv')
csv_product = CSV.parse(csv_product)
csv_product.each do |row|
  p = Product.new
  p.name = row[1]
  p.vendor_id = row[2]
  p.save
end

csv_sale = File.read('./seed_csvs/sales.csv')
csv_sale = CSV.parse(csv_sale)
csv_sale.each do |row|
  s = Sale.new
  s.amount = row[1]
  s.purchase_time = row[2]
  s.vendor_id = row[3]
  s.product_id = row[4]
  s.save
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
