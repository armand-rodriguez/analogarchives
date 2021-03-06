class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :orders
  belongs_to :user, optional: true

# Used in line_items_controller
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  def total_items
    line_items.inject(0){|sum,e| sum + e.quantity }
  end
end
