# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_file_path_markets = './seed_csvs/markets.csv'

CSV.foreach(csv_file_path_markets) do |row|
  Market.create!({
    :name => row[1],
    :address => row[2],
    :city => row[3],
    :county => row[4],
    :state => row[5],
    :zip => row[6]
  })
end

csv_file_path_products = './seed_csvs/products.csv'

CSV.foreach(csv_file_path_products) do |row|
  Product.create!({
    :name => row[1],
    :vendor_id => row[2]
    })
end

csv_file_path_sales = './seed_csvs/sales.csv'

CSV.foreach(csv_file_path_sales) do |row|
  Sale.create!({
    :amount => row[1],
    :purchase_time => row[2],
    :vendor_id => row[3],
    :product_id => row[4]
    })
end

csv_file_path_vendors = './seed_csvs/vendors.csv'

CSV.foreach(csv_file_path_vendors) do |row|
  Vendor.create!({
    :name => row[1],
    :employees => row[2],
    :market_id => row[3],
    })
end
