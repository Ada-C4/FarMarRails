class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def self.total_sales(vendor_id)
    vendor = Vendor.find(vendor_id)
    total = 0
    sales = vendor.sales
    sales.each do |sale|
      total = total + sale.amount
    end
    return total
  end

  def self.current_month_sales(vendor_id)
    vendor = Vendor.find(vendor_id)
    sales = vendor.sales
    month_sales = sales.where()
    # range?
  end
end
