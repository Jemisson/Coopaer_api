# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_member, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Registrado com sucesso!' }
      }
    else
      render json: {
        status: { message: "Cooperado não pode ser criado. #{current_member.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
