require 'rails_helper'

RSpec.describe Members::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env['devise.mapping'] = Devise.mappings[:member]
  end

  describe 'POST #signup' do
    context 'with valid parameters' do
      it 'creates a new member' do
        member_params = {
          email: 'member@member.com',
          password: '123@456'
        }

        post :create, params: { member: member_params }, as: :json
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new member' do
        member_params = {
          email: 'member@member.com',
          password: ''
        }

        post :create, params: { member: member_params }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to be_json_eql({
          status: { message: 'Cooperado não pode ser criado. Password can\'t be blank' }
        }.to_json)
      end
    end
  end
end
