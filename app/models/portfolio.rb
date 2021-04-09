class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :port_stocks
  has_many :stocks, through: :port_stocks
end
