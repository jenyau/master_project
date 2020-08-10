class News < ApplicationRecord
  mount_uploader :title_image, ImageUploader

end
