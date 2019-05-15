class Oss
  BASE_PATH = File.join(Rails.root, 'storage')

  class << self
    def load_file(path)
      File.read(path)
    end

    def store_file(content)
      filename = SecureRandom.uuid + '.txt'
      dir = File.join(BASE_PATH, Time.now.strftime('%Y/%m/%d/%H'))
      Dir.exist?(dir) || FileUtils.mkdir_p(dir)
      path = File.join(dir, filename)
      File.open(path, 'w') do |f|
        f.write(content)
      end
      path
    end

    def remove_file(path)
      FileUtils.rm_f(path)
    end
  end
end