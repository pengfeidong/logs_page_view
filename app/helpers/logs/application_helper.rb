module Logs
  module ApplicationHelper
    def log_file
      (params[:name] || Rails.env) + '.log'
    end

    def log_file_path(log_name)
      root_path + log_name
    end

    def download_log_path(log_name)
      download_path + "?f=" + log_name
    end

    def tail_log_path(log_name)
      tail_path + "?f=" + log_name
    end

    def lines(file_path_name)
      `cat #{ file_path_name } | wc -l`.to_s
    end
  end
end
