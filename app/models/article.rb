class Article < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  validates :description, presence: true
  validate :correct_image_type

  private

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'Must be a JPEG or PNG file!')
    elsif image.attached? == false
      errors.add(:image, 'must be attached!')
    end
  end
end
