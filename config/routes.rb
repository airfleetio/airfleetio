Rails.application.routes.draw do
  resource :fleet, only: %i[show update]
  resources :bookmarks, only: :create
  root to: 'bookmarks#new'
end
