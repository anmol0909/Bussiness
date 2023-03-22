class Product < ApplicationRecord
  has_many :productimages
  belongs_to :category
  validates :name, :description, :category_id, :price, presence: true
  validates :status, presence: true, inclusion: { in: %w(active inactive draft) }
  enum status: { draft: 'draft', active: 'active', inactive: 'inactive' }, _default: :draft
end
