# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

markets = [
  { name: "People's Co-op Farmers Market", address:"30th and Burnside", city: "Portland", county: "Multnomah", state: "Oregon", zip: "97202" }
]

markets.each do |market|
  Market.create(market)
end
