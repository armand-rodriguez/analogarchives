class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  validates :total_price, numericality: { greater_than: 0 } 
end
