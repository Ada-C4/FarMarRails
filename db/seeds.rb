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



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
