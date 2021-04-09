class Stock < ApplicationRecord
  has_many :port_stocks
  has_many :portfolios, through: :port_stocks
  belongs_to :user
end
