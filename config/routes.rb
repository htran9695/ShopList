Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists do
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  end
