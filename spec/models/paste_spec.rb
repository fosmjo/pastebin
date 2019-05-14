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

require 'rails_helper'

RSpec.describe Paste, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
