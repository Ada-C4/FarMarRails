class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :vendor_id, presence: true
end
