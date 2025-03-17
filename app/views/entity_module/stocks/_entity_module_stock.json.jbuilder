json.extract! stock, :id, :move_type, :quantity, :cost_unit, :product_id, :created_at, :updated_at
json.url entity_module_stock_url(stock, format: :json)
