module Logs
  class Viewer
    LOG_PATH = Rails.root + 'log/'

    def self.log_path(file_name)
      LOG_PATH + file_name
    end
  end
end
