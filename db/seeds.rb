# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
markets = CSV.read("./seed_csvs/markets.csv")

market_list = {}

markets.each do |market|
  {
  name: market[0],
  address: market[1],
  city: market[2],
  county: market[3],
  state: market[4],
  zip: market[5]
  }
  market_list.push(market)
end

market_list.each do |market|
  Market.create(market)
end
