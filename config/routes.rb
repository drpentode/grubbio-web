GrubbioWeb::Application.routes.draw do

  devise_for  :users, 
              controllers: { 
                registrations: "users/registrations", 
                sessions: "users/sessions"
              }

  resources :users
  
  resources :businesses do
    resource :business_profiles
  end

  #resources :markets

  resources :food_products
  
  root :to => 'pages#index'

  resources :product_categories do
    resources :food_products
  end

  root :to => 'pages#index'

  resources :markets do
  	get :autocomplete_market_market_name, :on => :collection
	end
end
