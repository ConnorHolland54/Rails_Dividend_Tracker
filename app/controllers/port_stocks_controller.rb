class PortStocksController < ApplicationController
  include UsersHelper
  def create
    error = false
      tickers = []
    port_stock_params.first.each do |id|
      if !current_user.portfolios.find(port_stock_params[1]).stocks.include?(Stock.find(id))
        port_stock = PortStock.create(portfolio_id: port_stock_params[1].to_i, stock_id: id.to_i, shares: 0)
      else
        error = true
        tickers << id
      end
      if error
        symbols = []
        tickers.each do |id|
          symbols << Stock.find(id.to_i).symbol
        end
        message = "Stock(s) already exists: #{symbols.join(', ')}"
        flash[:notice] = message
      end
    end
    redirect_to portfolio_stocks_path(port_stock_params[1].to_i)
  end

  private
  def port_stock_params
    params.values_at(:stock_ids, :port_id)
  end
end
