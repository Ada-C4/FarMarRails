class Vendor < ActiveRecord::Base
  belongs_to :market
  validates :name, presence: true
  validates :market_id, presence: true
end
