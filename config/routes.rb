Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do

      concern :likeable do |options|
        shallow do
          post "/likes", { to: "likes#create", on: :member }.merge(options)
          delete "/unlikes", { to: "likes#destroy", on: :member }.merge(options)
        end
      end

      resources :users, only: [] do
        resources :followings, only: %i(index create destroy), shallow: true
      end

      resources :posts, only: %i(create show update destroy) do
        concerns :likeable, likeable_type: 'Post'
      end
    end
  end
end
