require 'active_support/concern'

module Logs
  module Concerns
    module LogsLoader
      extend ActiveSupport::Concern

      included do
        before_action :load_logs
        before_action :load_logs_list

        def load_logs
          file_name = params[:name] || Rails.env
          @logs = File.join(Logs::Viewer.log_path(file_name + ".log"))
        end

        def load_logs_list
          @log_files = Logs::LogFiles.all
        end
      end
    end
  end
end
