class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  validates :artist, presence: true
  validates :album, presence: true
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} is the maximum number of characters allowed." }
  validates :price, presence: true, length: { maximum: 7 }
  has_many :line_items

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'line items present')
      throw :abort
    end
  end
end
