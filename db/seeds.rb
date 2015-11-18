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
