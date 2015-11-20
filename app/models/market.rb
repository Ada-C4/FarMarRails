class Market < ActiveRecord::Base
	has_many :vendors
  def self.search(query)
  	query.upcase
    where("name like ?", "%#{query}%") 
  end
end
