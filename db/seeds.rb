require "csv"

# Market model

market_csv = CSV.read("./seed_csvs/markets.csv")
market_array = []

market_csv.each do |row|
	market_hash = {
		name: row[1], address: row[2], city: row[3], 
		county: row[4], state: row[5], zip: row[6]
	}
	market_array.push(market_hash)
end

market_array.each do |market|
	Market.create(market)
end

# Vendor model

vendor_csv = CSV.read("./seed_csvs/vendors.csv")
vendor_array = []

vendor_csv.each do |row|
	vendor_hash = {
		name: row[1], no_employees: row[2], market_id: row[3]
	}
	vendor_array.push(vendor_hash)
end

vendor_array.each do |vendor|
	Vendor.create(vendor)
end

# Product model

product_csv = CSV.read("./seed_csvs/products.csv")
product_array = []

product_csv.each do |row|
	product_hash = {
		name: row[1], vendor_id: row[2]
	}
	product_array.push(product_hash)
end

product_array.each do |product|
	Product.create(product)
end

# Sale model

sale_csv = CSV.read("./seed_csvs/sales.csv")
sale_array = []

sale_csv.each do |row|
	sale_hash = {
		amount: row[1], purchase_time: row[2],
		vendor_id: row[3], product_id: row[4]
	}
	sale_array.push(sale_hash)
end

sale_array.each do |sale|
	Sale.create(sale)
end
