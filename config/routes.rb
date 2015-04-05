Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: { format: :json } do
    resources :groups, except: [:new, :edit] do
      get :own, on: :collection
    end
    # resources :trips, except: [:new, :edit]
  end
end
