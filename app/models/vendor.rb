class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales
  has_many :products

  def monthly_sales
    @time_month = Time.now.month
    @time_year = Time.now.year
    first_of_month = Time.new(@time_year, @time_month, 1)
    sales_month = sales.where("purchase_time >= ?", first_of_month)
    return sales_month
  end
end
