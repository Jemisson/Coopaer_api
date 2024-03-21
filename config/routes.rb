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
      post '/upload_member_document/:id', to: 'profile_members#upload_documents'
      delete '/member_documents/:document_id', to: 'profile_members#destroy_document'
      post '/report_uploads/create', to: 'report_uploads#create'
    end
  end
end
