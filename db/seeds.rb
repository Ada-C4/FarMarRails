# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#  cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#  Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'

CSV.read("./seed_csvs/markets.csv").map do |row|
  Market.create(id: row[0], name: row[1], address: row[2], city: row[3], county: row[4], state: row[5], zip: row[6])
end

CSV.read("./seed_csvs/vendors.csv").map do |row|
  Vendor.create(id: row[0], name: row[1], num_employees:row[2], market_id:row[3])
end

CSV.read("./seed_csvs/products.csv").map do |row|
  Product.create(id: row[0], name: row[1], vendor_id:row[2])
end
