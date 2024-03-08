# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :admins, path: '', path_names: {
                                  sign_in: 'admin/login',
                                  sign_out: 'admin/logout',
                                  registration: 'admin/signup'
                                },
                      controllers: {
                        sessions: 'admins/sessions',
                        registrations: 'admins/registrations'
                      }

  devise_for :members, path: '', path_names: {
                                   sign_in: 'member/login',
                                   sign_out: 'member/logout',
                                   registration: 'member/signup'
                                 },
                       controllers: {
                         sessions: 'members/sessions',
                         registrations: 'members/registrations'
                       }

  namespace :api do
    namespace :v1 do
      resources :profile_members, except: %i[destroy]
    end
  end
end
