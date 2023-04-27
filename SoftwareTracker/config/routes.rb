Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"

  resources :users do
    get :manage_tools, as: :manage_tools
    resources :user_tools, only: [:create, :destroy]
  end
  
  resources :tools
  resources :categories
end
