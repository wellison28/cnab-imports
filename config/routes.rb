Rails.application.routes.draw do
  resources :imports, only: %i[new create]
  resources :store_transactions, only: %i[index show]
  root :to => "imports#new"
end
