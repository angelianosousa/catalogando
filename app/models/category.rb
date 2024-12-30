# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entity_id  :bigint           not null
#
# Indexes
#
#  index_categories_on_entity_id  (entity_id)
#
# Foreign Keys
#
#  fk_rails_...  (entity_id => entities.id)
#
class Category < ApplicationRecord
  # Associations
  belongs_to :entity
  has_many :categories_products, dependent: :destroy
  has_many :products, through: :categories_products

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Ransack filter
  def self.ransackable_attributes(auth_object = nil)
    %w[id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[]
  end
end
