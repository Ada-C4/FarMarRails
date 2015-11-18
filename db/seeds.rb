# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

def create_market_hash(market_array)
  market_hash = {}
  market_hash[:id] = market_array[0].to_i
  market_hash[:name] = market_array[1]
  market_hash[:address] = market_array[2]
  market_hash[:city] = market_array[3]
  market_hash[:county] = market_array[4]
  market_hash[:state] = market_array[5]
  market_hash[:zip] = market_array[6]
  return market_hash
end

csv_file = CSV.read('./seed_csvs/markets.csv')
# Create empty array which will hold all the objects
csv_file.each do |row|
  # Convert the array to a hash
  csv_hash = create_market_hash(row)
  # Create an object from each row-hash in the csv file
  Market.create(csv_hash)
end

def create_vendor_hash(array)
  vendor = {}
  vendor[:id] = array[0].to_i
  vendor[:name] = array[1]
  vendor[:no_employees] = array[2].to_i
  vendor[:market_id] = array[3].to_i
  return vendor
end

csv_file = CSV.read('./seed_csvs/vendors.csv')
# Create empty array which will hold all the objects
csv_file.each do |row|
  # Convert the array to a hash
  csv_hash = create_vendor_hash(row)
  # Create an object from each row-hash in the csv file
  Vendor.create(csv_hash)
end

def create_product_hash(product_array)
  product_hash = {}
  product_hash[:id] = product_array[0].to_i
  product_hash[:name] = product_array[1]
  product_hash[:vendor_id] = product_array[2].to_i
  return product_hash
end

csv_file = CSV.read('./seed_csvs/products.csv')
# Create empty array which will hold all the objects
csv_file.each do |row|
  # Convert the array to a hash
  csv_hash = create_product_hash(row)
  # Create an object from each row-hash in the csv file
  Product.create(csv_hash)
end
