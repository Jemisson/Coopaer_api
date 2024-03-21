# frozen_string_literal: true

module Api
  module V1
    class SenarReportsController < ApplicationController
      def index
        report = SenarReportService.retrieve_data(params)

        render json: SenarReportSerializer.new(
          report,
          meta: {
            total_count: report.total_count,
            total_pages: report.total_pages,
            current_page: report.current_page,
            per_page: report.limit_value
          }
        ), status: :ok
      end
    end
  end
end
