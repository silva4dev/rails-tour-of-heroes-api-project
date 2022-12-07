Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  namespace :api, defaults: { format: :json } do
    resources :heroes
  end
end
