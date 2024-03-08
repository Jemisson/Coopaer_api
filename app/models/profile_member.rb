# frozen_string_literal: true

class ProfileMember < ApplicationRecord
  belongs_to :member

  has_one :address
  has_one :bank_account

  has_many :dependents
  has_many :academic_educationals

  enum gender: { female: 0, male: 0 }

  accepts_nested_attributes_for :member, :academic_educationals, :address, :bank_account, :dependents,
                                reject_if: :all_blank, allow_destroy: true
end
