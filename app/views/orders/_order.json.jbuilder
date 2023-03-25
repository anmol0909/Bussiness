json.extract! order, :id, :status, :product_id, :merchant_id, :cart_id, :created_at, :updated_at
json.url order_url(order, format: :json)
