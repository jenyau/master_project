class Product < ApplicationRecord

  mount_uploader :image, ImageUploader

  enum category: {biscuits: 0, puff_product: 1, cake: 2, desert: 3}

  scope :desert, -> { where(category: 'desert') }
  scope :cake, -> { where(category: 'cake') }
  scope :puff_product, -> { where(category: 'puff_product') }
  scope :biscuits, -> { where(category: 'biscuits') }
end
