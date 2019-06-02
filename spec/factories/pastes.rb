# == Schema Information
#
# Table name: pastes
#
#  expired_at :datetime
#  path       :string(255)      not null
#  shortlink  :string(7)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_pastes_on_created_at  (created_at)
#  index_pastes_on_user_id     (user_id)
#

FactoryBot.define do
  factory :paste do
    expired_at { nil }
  end
end
