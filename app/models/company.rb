# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  extend FriendlyId
  
  friendly_id :name, use: :slugged

  has_many :admins
end
