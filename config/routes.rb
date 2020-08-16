Rails.application.routes.draw do
  resources :imports, only: %i[new create]
  resources :store_transactions, only: %i[index]
end
