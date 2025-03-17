# == Schema Information
#
# Table name: entities
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
#  nickname   :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_entities_on_slug  (slug) UNIQUE
#
#
class Entity < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Callbacks
  after_create :create_landpage

  # Associations
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :admin_entities, dependent: :destroy

  has_one :landpage, dependent: :destroy

  # Validations
  validates :name, presence: true

  def create_landpage
    Landpage.create!(entity_id: id)
  end

  # Ransack filter
  def self.ransackable_attributes(auth_object = nil)
    %w[]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[categories]
  end
end
