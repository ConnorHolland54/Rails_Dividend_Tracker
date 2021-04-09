class PortfoliosController < ApplicationController
  include UsersHelper
  before_action :require_logged_in

  def index
    @portfolios = current_user.portfolios
  end

  def create
    @portfolio = Portfolio.new(name: portfolio_params)
    @portfolio.user_id = current_user.id
    if @portfolio.save
      # Display success message
      redirect_to portfolios_path
    else
      # Display error message
    end
  end

  private

  def portfolio_params
    params.fetch(:name)
  end

end
