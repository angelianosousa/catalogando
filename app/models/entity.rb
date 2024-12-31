
#
class Entity < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Callbacks
  after_create :create_landpage

  # Associations
  has_many :products
  has_many :categories
  has_many :admin_entities

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
