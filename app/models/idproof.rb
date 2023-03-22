class Idproof < ApplicationRecord
  mount_uploader :document, ImageUploader
  belongs_to :merchant
  validates :document, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true
end
