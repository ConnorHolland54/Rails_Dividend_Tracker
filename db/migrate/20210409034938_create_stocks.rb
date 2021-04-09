class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.string :description
      t.string :dividend_per_share
      t.string :dividend_date
      t.integer :user_id

      t.timestamps
    end
  end
end
