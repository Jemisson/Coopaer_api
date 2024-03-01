# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: '', path_names: {
                                  sign_in: 'login',
                                  sign_out: 'logout',
                                  registration: 'signup'
                                },
                      controllers: {
                        sessions: 'admins/sessions',
                        registrations: 'admins/registrations'
                      }

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      # routes
    end
  end
end
