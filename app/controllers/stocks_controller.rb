class StocksController < ApplicationController
  include UsersHelper

  def index
    @params = params[:portfolio_id]
    if params[:portfolio_id]
      @all_stocks = current_user.stocks
      # @stocks = current_user.portfolios.find(params[:portfolio_id]).stocks
      @stocks = current_user.portfolios.find(params[:portfolio_id]).port_stocks
    else
      @stocks = current_user.stocks
    end
  end

  def create
    ticker = stock_params.upcase
    stock_info = Api.get_info(ticker)
    if !current_user.stocks.any? {|x| x.symbol == ticker} && !stock_info.empty?
      stock = Stock.create(:symbol => stock_info['Symbol'], :name => stock_info["Name"], :description => stock_info["Description"], :dividend_per_share => stock_info["DividendPerShare"], :dividend_date => stock_info["DividendDate"], :user_id => current_user.id)
      redirect_to '/stocks'
    else
      # Print Error
      flash[:notice] = "Error: Stock already exists or ticker is invalid"
      redirect_to '/stocks'
    end
  end

  private
  def stock_params
    params.fetch(:ticker)
  end
end
