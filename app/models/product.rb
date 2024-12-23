# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  discount       :decimal(, )      default(0.0)
#  name           :string
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("BRL"), not null
#  visible        :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  entity_id      :bigint           not null
#
# Indexes
#
#  index_products_on_entity_id  (entity_id)
#
# Foreign Keys
#
#  fk_rails_...  (entity_id => entities.id)
#
class Product < ApplicationRecord
  # Associations
  belongs_to :entity
  has_many :categories_products
  has_many :categories, through: :categories_products

  # Validations
  validates :discount, numericality: { is_greater_than_or_equal_to: 0, is_less_than_or_equal_to: 100 }

  # Money rails
  monetize :price_cents

  def final_price
    price_cents * (1 - discount / 100)
  end
end

