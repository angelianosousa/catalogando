# == Schema Information
#
# Table name: user_accounts
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  entity_id              :bigint           not null
#
# Indexes
#
#  index_user_accounts_on_email                 (email) UNIQUE
#  index_user_accounts_on_entity_id             (entity_id)
#  index_user_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (entity_id => entities.id)
#
class AdminEntity < UserAccount
end
