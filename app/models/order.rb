class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  validates :total_price, numericality: { greater_than: 0 }

  def marl_as_shipped
    
  end
end
