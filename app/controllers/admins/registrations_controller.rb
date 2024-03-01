# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_admin, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Registrado com sucesso!' }
      }
    else
      render json: {
        status: { message: "Administrador não pode ser criado. #{current_admin.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
