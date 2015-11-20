module SalesHelper
  def in_dollars(sale)
    sale.to_f / 100
  end

end
