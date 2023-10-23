Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  root to: "articles#index"

  resources :articles do
    get "user/:user_id", to: "articles#from_author"
  end

  #get "/articles/new", to: "articles#new"
  #get "/articles/:id", to:"articles#show"
  #get "/articles/:id/edit", to:"articles#edit"
  #patch "/articles/:id", to: "articles#update", as: :article
  #post "/articles", to: "articles#create"
  #delete "/articles/:id", to: "articles#destroy"
  # Defines the root path route ("/")
  # root "posts#index"
end
