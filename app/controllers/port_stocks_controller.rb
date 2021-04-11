class PortStocksController < ApplicationController
  include UsersHelper
  def create
    if port_stock_params.first == nil
      flash[:notice] = "Portfolio must contain at least one stock"
      return redirect_to portfolio_stocks_path(port_stock_params[1])
    end

    port_stock_params.first.each do |id|
      if !current_user.portfolios.find(port_stock_params[1]).stocks.include?(Stock.find(id))
        port_stock = PortStock.create(portfolio_id: port_stock_params[1].to_i, stock_id: id.to_i, shares: 0)
      end
    end
    if !removed_stocks(port_stock_params.first).empty?
      removed_stocks(port_stock_params.first).each do |id|
        port_stock = current_user.portfolios.find(port_stock_params[1]).port_stocks.find_by(stock_id: id)
        port_stock.destroy
      end
    end
    redirect_to portfolio_stocks_path(port_stock_params[1].to_i)
  end

  private
  def port_stock_params
    params.values_at(:stock_ids, :port_id)
  end

  def port_stock_ids
    ids = []
    current_user.portfolios.find(port_stock_params[1]).port_stocks.each do |s|
      ids << s.stock_id
    end
    ids
  end

  def removed_stocks(selected_params)
    id_to_remove = []
    port_stock_ids.each do |id|
      if !selected_params.map {|x| x.to_i}.include?(id)
        id_to_remove << id
      end
    end
    id_to_remove
  end



end
