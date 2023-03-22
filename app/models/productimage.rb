class Productimage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
  validates :image, presence: true
  validates :product_id, presence: true

end
