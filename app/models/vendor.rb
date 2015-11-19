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


end
