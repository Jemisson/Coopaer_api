# frozen_string_literal: true

class ProfileMemberService
  class << self
    def retrieve_data(params)
      query = ProfileMember
              .includes(:member, :academic_educationals, :address, :bank_account, :dependents)

      query = query.where('LOWER(name) LIKE ?', "%#{params[:nm].downcase}%") if params[:nm].present?

      query
        .order(created_at: :desc)
        .where(status: params[:stat] || 0)
        .page(params[:page] || 1)
        .per(params[:per_page] || 10)
    end
  end
end
