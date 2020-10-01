class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_name, against: :name

  validates :name, presence: true
  validates :image, presence: true
  validates :weight, presence: true
  validates :description, presence: true
  validates_length_of :name, :maximum => 40
  validates_length_of :description, :maximum => 200
  validates_length_of :weight, :maximum => 5

  mount_uploader :image, ImageUploader

  enum category: ['Печенье', 'Слойка', 'Торт', 'Пирожное']

  scope :desert, -> { where(category: 'Пирожное') }
  scope :cake, -> { where(category: 'Торт') }
  scope :puff_product, -> { where(category: 'Слойка') }
  scope :biscuits, -> { where(category: 'Печенье') }
end
