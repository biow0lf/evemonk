Rails.application.routes.draw do
  namespace :backoffice do
    # TODO: spec this
    mount PgHero::Engine, at: 'pghero'
  end

  namespace :api, defaults: { format: 'json' } do
    resources :docs, only: :index

    resource :sign_up, only: :create

    resource :sign_in, only: :create

    resource :sign_out, only: :destroy

    resources :sessions, only: [:index, :destroy]

    resource :profile, only: [:show, :update]

    # namespace :backoffice do
    #   resources :users, only: [:index, :show, :update, :destroy]
    # end
  end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'main#index'

  get '*path', to: 'main#index'
end
