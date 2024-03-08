# frozen_string_literal: true

class ProfileMemberService
  class << self
    def retrieve_data(params)
      ProfileMember
        .includes(:member, :academic_educationals, :address, :bank_account, :dependents)
        .order(created_at: :desc)
        .page(params[:page] || 1)
        .per(params[:per_page] || 10)
    end
  end
end
