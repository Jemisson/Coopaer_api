# frozen_string_literal: true

class ProfileMember < ApplicationRecord
  belongs_to :member

  has_one :address
  has_one :bank_account

  has_many :dependents
  has_many :academic_educationals

  has_many_attached :documents

  enum gender: { female: 0, male: 1 }
  enum status: { active: 0, inactive: 1, pending: 2 }

  accepts_nested_attributes_for :member, :academic_educationals, :address, :bank_account, :dependents,
                                reject_if: :all_blank, allow_destroy: true

  def document_urls
    return [] unless documents.attached?

    documents.map do |document|
      {
        url: Rails.application.routes.url_helpers.url_for(document),
        filename: document.filename
      }
    end
  end
end
