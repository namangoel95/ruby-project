Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :purchase_orders
  resources :epiosdes
  resources :movies
  resources :seasons, only: [] do
  	get  :movies_seasons_list, on: :collection
  end
end
