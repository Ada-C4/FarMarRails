# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'

markets_csv = CSV.read("./seed_csvs/markets.csv")
markets_csv.each do |id, name, address, city, county, state, zip|
  hash = {:id => id, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip}
  Market.create(hash)
end

vendors_csv = CSV.read("./seed_csvs/vendors.csv")
vendors_csv.each do |id, name, num_employees, market_id|
  hash = {:id => id, :name => name, :num_employees => num_employees, :market_id => market_id}
  Vendor.create(hash)
end

sales_csv = CSV.read("./seed_csvs/sales.csv")
sales_csv.each do |id, amount, purchase_time, vendor_id, product_id|
  hash = {:id => id, :amount => amount, :purchase_time => purchase_time, :vendor_id => vendor_id, :product_id => product_id}
  Sale.create(hash)
end

products_csv = CSV.read("./seed_csvs/products.csv")
products_csv.each do |id, name, vendor_id|
  hash = {:id => id, :name => name, :vendor_id => vendor_id}
  Product.create(hash)
end
