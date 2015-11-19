class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  def self.current_month_sales(vendor_id)
    vendor = Vendor.find(vendor_id)
    sales = vendor.sales
    month_sales = sales.where(purchase_time: Time.now.beginning_of_month..Time.now)
    return month_sales
  end

  def self.num_current_month_sales(vendor_id)
    sales = self.current_month_sales(vendor_id)
    return sales.count
  end

end
