Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do

      resources :users, only: [] do
        resources :followings, only: %i(create destroy), shallow: true
      end

      resources :posts, only: %i(create show update destroy)

    end
  end
end
