class CreatePortStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :port_stocks do |t|
      t.integer :stock_id
      t.integer :portfolio_id
      t.integer :shares

      t.timestamps
    end
  end
end
