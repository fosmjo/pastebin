class  Base62
  CHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

  def self.encode(number)
    nums = number.digits(62).reverse
    nums.map { |i| CHARS[i] }.join
  end
end