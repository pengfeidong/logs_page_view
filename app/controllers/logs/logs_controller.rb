require_dependency 'logs/application_controller'

module Logs
  class LogsController < ApplicationController
    include Logs::ApplicationHelper
    include Logs::Concerns::LogsLoader
    include Logs::Concerns::Pagination
    skip_before_action :load_logs, only: [:download, :tail]
    skip_before_action :load_logs_list, only: [:download, :tail]
    skip_before_action :rendered_logs, only: [:download, :tail]

    def index; end

    def show; end

    def download
      file_name = params[:f]
      send_file Logs::Viewer.log_path(file_name)
    end

    def tail
      @file_name = params[:f]
      log = File.join(Logs::Viewer.log_path(@file_name))
      @lines = `tail -500 #{ log }`.split(/\n/)
      respond_to do |wants|
        wants.html
        wants.json{ render(:json => @lines) }
      end
    end
  end
end
