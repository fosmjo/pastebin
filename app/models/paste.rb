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

class Paste < ApplicationRecord
  attr_accessor :content

  SHORTLINK_LEN = 7

  before_save :save_content_to_oss

  class << self
    def gen_shortlink(remote_ip)
      num = Digest::MD5.hexdigest(remote_ip + Time.now.to_f.to_s).to_i(16)
      str = Base62.encode(num)
      str[0...SHORTLINK_LEN]
    end
  end

  def save_content_to_oss
    self.path = Oss.store_file(content)
  end

  def content
    @content ||= Oss.load_file(path)
  end
end
