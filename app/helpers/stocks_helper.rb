module StocksHelper
  def stock_exist?(port_id, stock_id)
    current_user.portfolios.find(port_id).stocks.include?(Stock.find(stock_id))
  end
end
