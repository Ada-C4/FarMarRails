class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product
  validates :vendor_id, presence: true
  validates :product_id, presence: true
end
