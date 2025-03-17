# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  total_value :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  entity_id   :bigint           not null
#
# Indexes
#
#  index_orders_on_entity_id  (entity_id)
#
# Foreign Keys
#
#  fk_rails_...  (entity_id => entities.id)
#
class Order < ApplicationRecord
  belongs_to :entity
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: :all_blank
end
