# == Schema Information
#
# Table name: entities
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Entity < ApplicationRecord
  # Validations
  has_many :products
  has_many :categories
  has_many :admin_entities

  # Validations
  validates :name, presence: true
end
