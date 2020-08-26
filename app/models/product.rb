class Product < ApplicationRecord

  mount_uploader :image, ImageUploader

  enum category: ['Печенье', 'Слойка', 'Торт', 'Пирожное']

  scope :desert, -> { where(category: 'Пирожное') }
  scope :cake, -> { where(category: 'Торт') }
  scope :puff_product, -> { where(category: 'Слойка') }
  scope :biscuits, -> { where(category: 'Печенье') }
end
