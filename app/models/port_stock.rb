class PortStock < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock

  def symbol
    stock = Stock.find(self.stock_id)
    stock.symbol
  end

  def name
    stock = Stock.find(self.stock_id)
    stock.name
  end

end
