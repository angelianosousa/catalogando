# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  cost_unit  :decimal(, )
#  move_type  :integer
#  quantity   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entity_id  :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_stocks_on_entity_id   (entity_id)
#  index_stocks_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (entity_id => entities.id)
#  fk_rails_...  (product_id => products.id)
#
class Stock < ApplicationRecord
  enum :move_type, { buyer: 0, sells: 1 }

  belongs_to :product
  belongs_to :entity

  def total_cost
    quantity.to_i * cost_unit
  end
end
