Rails.application.routes.draw do
  resources :imports, only: %i[new create]
  resources :transactions, only: %i[index]
end
