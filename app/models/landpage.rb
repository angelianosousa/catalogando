# == Schema Information
#
# Table name: landpages
#
#  id         :bigint           not null, primary key
#  banner     :string
#  logo       :string
#  open       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entity_id  :bigint           not null
#
# Indexes
#
#  index_landpages_on_entity_id  (entity_id)
#
# Foreign Keys
#
#  fk_rails_...  (entity_id => entities.id)
#
class Landpage < ApplicationRecord
  belongs_to :entity
end
