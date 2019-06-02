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

require 'rails_helper'

RSpec.describe Paste, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
