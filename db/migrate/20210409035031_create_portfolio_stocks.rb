class CreatePortfolioStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_stocks do |t|
      t.integer :portfolio_id
      t.integer :stock_id
      t.integer :shares

      t.timestamps
    end
  end
end
