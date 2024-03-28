Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  namespace :api do
    get "/healthcheck", to: 'healthcheck#index'
    post '/clients', to: 'clients#store'
    post '/sessions', to: 'sessions#store'
  end


  root to: redirect('/api-docs')

  # Defines the root path route ("/")
  # root "posts#index"
end
