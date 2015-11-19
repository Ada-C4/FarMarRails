class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales, :products
end
