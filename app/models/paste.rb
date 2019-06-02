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

class Paste < ApplicationRecord
  belongs_to :user, optional: true

  attr_accessor :content

  SHORTLINK_LEN = 7

  before_save :save_content_to_oss
  after_destroy :remove_content_in_oss

  class << self
    def gen_shortlink(remote_ip)
      num = Digest::MD5.hexdigest(remote_ip + Time.now.to_f.to_s).to_i(16)
      str = Base62.encode(num)
      str[0...SHORTLINK_LEN]
    end

    def clear_expired_pastes
      where.not(expired_at: nil).where('expired_at < ?', Time.now).destroy_all
    end
  end

  def save_content_to_oss
    self.path = Oss.store_file(content)
  end

  def remove_content_in_oss
    Oss.remove_file(path)
  end

  def content
    @content ||= Oss.load_file(path)
  end

  def as_json(*)
    super(except: %i[path]).merge(content: content)
  end
end
