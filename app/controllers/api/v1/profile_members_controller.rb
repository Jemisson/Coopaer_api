# frozen_string_literal: true

module Api
  module V1
    class ProfileMembersController < ApplicationController
      before_action :set_profile_member, only: %i[show update upload_documents destroy_document]

      def index
        profile_member = ProfileMemberService.retrieve_data(params)

        render json: ProfileMemberSerializer.new(
          profile_member,
          meta: {
            total_count: profile_member.total_count,
            total_pages: profile_member.total_pages,
            current_page: profile_member.current_page,
            per_page: profile_member.limit_value
          }
        ), status: :ok
      end

      def show
        render json: ProfileMemberSerializer.new(
          @profile_member,
          status: :ok
        )
      end

      def create
        profile_member = ProfileMember.new(profile_member_params)
        if profile_member.save
          render json: { code: :ok }, status: :created
        else
          render(
            status: :bad_request,
            json: { errors: [{ code: profile_member.errors.full_messages }] }
          )
        end
      end

      def update
        if @profile_member.update(profile_member_params)
          render json: { code: :ok }, status: :ok
        else
          render(
            status: :bad_request,
            json: { errors: [{ code: @profile_member.errors.full_messages }] }
          )
        end
      end

      def upload_documents
        document_name = params[:name]
        document_file = params[:document]

        @profile_member.documents.attach(io: document_file, filename: document_name)
      end

      def destroy_document
        @document = @profile_member.documents.find(params[:document_id])
        @document.purge
        render json: { message: 'Documento excluído com sucesso' }, status: :ok
      end

      private

      def set_profile_member
        @profile_member = ProfileMember.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Cooperado não encontrado' }, status: :not_found
      end

      def profile_member_params
        params
          .permit(:name, :cell_phone, :phone, :birth, :cpf, :rg, :gender, :marital_status, :pis, :expedition,
                  :mother_name, :father_name, :city_registration, :cnd,
                  documents: [],
                  academic_educationals_attributes: %i[id degree course number_register],
                  address_attributes: %i[id street number neighborhood city uf mailing email_mailing],
                  bank_account_attributes: %i[id account agency bank account_type pix],
                  dependents_attributes: %i[id name birth degree],
                  member_attributes: %i[id email password])
      end
    end
  end
end
