# == Schema Information
#
# Table name: categories_products
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_categories_products_on_category_id  (category_id)
#  index_categories_products_on_product_id   (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (product_id => products.id)
#
class CategoriesProduct < ApplicationRecord
  belongs_to :category
  belongs_to :product
end
