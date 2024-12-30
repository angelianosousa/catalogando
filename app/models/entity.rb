# == Schema Information
#
# Table name: entities
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
<<<<<<< Updated upstream
=======
#  slug       :string
>>>>>>> Stashed changes
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_entities_on_slug  (slug) UNIQUE
#
class Entity < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Callbacks
  after_create :create_landpage

  # Associations
  has_many :products
  has_many :categories

  has_one :landpage, dependent: :destroy

  # Validations
  validates :name, presence: true

  def create_landpage
    Landpage.create!(entity_id: id)
  end
end
