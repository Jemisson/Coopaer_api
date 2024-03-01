# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_user!
    return if admin_signed_in? || member_signed_in?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar])
  end
end
