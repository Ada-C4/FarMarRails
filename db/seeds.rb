# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

markets_csv = CSV.read(seeds_csvs/markets.csv)
markets_csv.each do |id, name, address, city, county, state, zip|
  hash = {:id => id, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip}
end
