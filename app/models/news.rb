class News < ApplicationRecord
  paginates_per 10

  validates :title, presence: true
  validates :body, presence: true
  validates_length_of :title, :maximum => 60
  validates_length_of :body, :maximum => 500


  mount_uploader :title_image, ImageUploader

end
