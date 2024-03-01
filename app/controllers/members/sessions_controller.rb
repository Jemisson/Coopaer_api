# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(_current_member, _opts = {})
    render json: {
      status: {
        code: 200,
        message: 'Autenticado com sucesso'
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, ENV['DEVISE_JWT']).first
      current_member = Member.find(jwt_payload['sub'])
    end

    if current_member
      render json: {
        status: 200,
        message: 'Saiu com sucesso'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'Não foi possível encontrar uma autenticação'
      }, status: :unauthorized
    end
  end
end
