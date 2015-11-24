class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales
  validates :name, presence: true
  validates :market_id, presence: true
end
