require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe Members::SessionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env['devise.mapping'] = Devise.mappings[:member]
  end

  describe 'POST #login' do
    context 'with valid credentials' do
      it 'authenticates the member and returns member data' do
        member = create(:member)

        post :create, params: { member: { email: member.email, password: member.password } }, as: :json

        expect(response).to have_http_status(:ok)
        expect(response.body).to be_json_eql({
          status: {
            code: 200,
            message: 'Autenticado com sucesso'
          }
        }.to_json)
      end
    end

    context 'with invalid credentials' do
      it 'does not authenticate the member' do
        post :create, params: { member: { email: 'invalid@member.com', password: 'invalidpassword' } }, as: :json

        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to be_json_eql({
          error: 'Invalid Email or password.'
        }.to_json)
      end
    end
  end

  describe 'DELETE #logout' do
    context 'when member is authenticated' do
      it 'logs out the member' do
        member = create(:member)
        headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, member)
        request.headers.merge!(auth_headers)

        delete :destroy, as: :json

        expect(response).to have_http_status(:ok)
        expect(response.body).to be_json_eql({
          status: 200,
          message: 'Saiu com sucesso'
        }.to_json)
      end
    end

    context 'when member is not authenticated' do
      it 'returns unauthorized' do
        delete :destroy, as: :json

        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to be_json_eql({
          message: 'Não foi possível encontrar uma autenticação',
          status: 401
        }.to_json)
      end
    end
  end
end
