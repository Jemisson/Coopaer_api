require 'rails_helper'

RSpec.describe Admins::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
  end

  describe 'POST #signup' do
    context 'with valid parameters' do
      it 'creates a new admin' do
        admin_params = {
          email: 'admin@admin.com',
          password: '123@456'
        }

        post :create, params: { admin: admin_params }, as: :json
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new admin' do
        admin_params = {
          email: 'admin@admin.com',
          password: ''
        }

        post :create, params: { admin: admin_params }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to be_json_eql({
          status: { message: 'Administrador não pode ser criado. Password can\'t be blank' }
        }.to_json)
      end
    end
  end
end
