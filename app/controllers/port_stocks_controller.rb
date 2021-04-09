class PortStocksController < ApplicationController
  include UsersHelper
  def create
    port_stock_params.first.each do |id|
      if !current_user.portfolios.find(port_stock_params[1]).stocks.include?(Stock.find(id))
        port_stock = PortStock.create(portfolio_id: port_stock_params[1].to_i, stock_id: id.to_i, shares: 0)
      else
        flash[:notice] = "Stock already exists in portfolio"
      end
    end
    redirect_to portfolio_stocks_path(port_stock_params[1].to_i)
  end

  private
  def port_stock_params
    params.values_at(:stock_ids, :port_id)
  end
end
