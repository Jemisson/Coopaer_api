# frozen_string_literal: true

module Api
  module V1
    class ReportUploadsController < ApplicationController
      def create
        if params[:file].present?
          file = params[:file]

          current_timestamp = Time.now.strftime('%Y%m%d%H%M%S')
          file_extension = File.extname(params[:file].original_filename)
          new_file_name = "#{current_timestamp}#{file_extension}"

          uploaded_file = upload_to_temp_reports(file, new_file_name)

          if uploaded_file
            file_path = Rails.root.join('storage', 'temp_reports', new_file_name).to_s
            system("RAILS_ENV=staging bundle exec rails pdf:extract['#{file_path}'] &")
          end

          render json: { message: 'Arquivo enviado com sucesso.' }
        else
          render json: { error: 'Nenhum arquivo enviado.' }, status: :unprocessable_entity
        end
      end

      private

      def upload_to_temp_reports(file, file_name)
        temp_reports_folder = 'temp_reports'
        storage_folder = Rails.root.join('storage', temp_reports_folder)

        # Criar a pasta temp_reports se ela não existir
        FileUtils.mkdir_p(storage_folder) unless File.directory?(storage_folder)

        # Salvar o arquivo na pasta temp_reports em storage
        uploaded_file = File.join(storage_folder, file_name)
        File.open(uploaded_file, 'wb') do |f|
          f.write(file.read)
        end

        uploaded_file
      end
    end
  end
end
