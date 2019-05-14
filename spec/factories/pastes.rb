# == Schema Information
#
# Table name: pastes
#
#  shortlink  :string(7)        not null, primary key
#  expired_at :datetime
#  path       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :paste do
    expired_at { nil }
  end
end
