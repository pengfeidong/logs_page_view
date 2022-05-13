require 'active_support/concern'

module Logs
  module Concerns
    module Pagination
      extend ActiveSupport::Concern

      PER_PAGE = 1000
      PAGE = 1

      included do
        before_action :rendered_logs

        def rendered_logs
          @per_page = (params[:per_page] || PER_PAGE).to_i
          @page = (params[:page] || PAGE).to_i
          file_name = params[:name] || Rails.env
          file_path_name = Logs::Viewer.log_path(file_name + ".log")

          range = ((@page - 1) * @per_page + 1).to_s + "," + (@per_page * @page).to_s + "p"
          @rendered_logs = `sed -n #{range} #{ file_path_name }`

          @pages = calculate_pages(file_path_name).to_i
        end

        def calculate_pages(file_path_name)
          float_count = lines(file_path_name).to_f / @per_page.to_f
          float_count != float_count.round ? float_count + 1 : float_count
        end
      end
    end
  end
end
