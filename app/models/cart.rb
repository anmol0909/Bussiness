class Cart < ApplicationRecord
  belongs_to :merchant
  belongs_to :product
  validates :product_id, presence: true
  validates :merchant_id, presence: true
end
