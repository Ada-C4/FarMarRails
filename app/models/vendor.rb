class Vendor < ActiveRecord::Base
	belongs_to :market
	has_many :products
	has_many :sales

	def self.search(query)
		query.upcase
    where("name like ?", "%#{query}%") 
  end
end
