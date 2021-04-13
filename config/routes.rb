# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api/v1' do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :users, only: :create
    end
  end

  resources :apidocs, only: [:index]
  resources :swagger, only: [:index]
end
