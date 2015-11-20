class Vendor < ActiveRecord::Base
  has_many :products
  belongs_to :market

  def total_sales
    total = 0
    self.products.each do |product|
      total += product.sales.inject(0) { |sum, sale| sum + sale.amount }
    end
    return total
  end

  def monthly_sales
    month_sales = []

    self.products.each do |product|
      sales = product.sales.find_all do |sale|
        Time.now.month == sale.purchase_time.month && Time.now.year == sale.purchase_time.year
      end

    month_sales += sales
    end

    return month_sales
  end

def total_monthly
  monthly_sales.inject(0) { |sum, sale| sum + sale.amount }
end

end
