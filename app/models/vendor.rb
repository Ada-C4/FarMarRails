class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def month_sales
    sales.where("purchase_time >= ?", Time.now.beginning_of_month)
  end

  def month_totals
    m = month_sales
    m.sum(:amount).to_f/100
  end
end
