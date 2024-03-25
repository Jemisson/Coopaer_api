# frozen_string_literal: true

class ProfileMemberSerializer
  include JSONAPI::Serializer

  attributes :name, :cell_phone, :phone, :birth, :cpf, :rg, :gender, :marital_status, :pis, :expedition,
             :mother_name, :father_name, :city_registration, :cnd,
             :member, :academic_educationals, :address, :bank_account, :dependents

  attribute :document_urls
end
