Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resource :sign_up, only: :create

      resource :sign_in, only: :create

      resource :sign_out, only: :destroy

      resources :sessions, only: [:index, :destroy]

      resources :api_keys, only: [:index, :create, :show, :update, :destroy]

      resource :profile, only: :show
    end
  end

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end
