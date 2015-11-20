class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

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
    month_sales = sales.where(purchase_time: Time.now.beginning_of_month..Time.now)
    return month_sales
  end

  def self.current_month_revenue(vendor_id)
    sales = self.current_month_sales(vendor_id)
    total = 0
    sales.each do |sale|
      total = total + sale.amount
    end
    return total
  end

end
