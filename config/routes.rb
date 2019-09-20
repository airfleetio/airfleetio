Rails.application.routes.draw do
  resources :vehicles
  resources :bookmarks, only: :create
  root to: 'bookmarks#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
