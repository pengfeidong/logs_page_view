module Logs
  class Viewer
    LOG_PATH = Rails.root + 'log/'

    def self.call(file_name)
      File.open(LOG_PATH + (file_name + '.log'))
    end

    def self.log_path
      LOG_PATH
    end
  end
end
