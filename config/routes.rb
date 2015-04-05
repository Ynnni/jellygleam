Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: { format: :json } do
    resources :groups, except: [:new, :edit] do
      collection do
        get :own
        get :search
      end
      member do
        post :join
        delete :leave
      end
    end
  end

  match '*path', to: 'application#routing_error', via: :all
end
