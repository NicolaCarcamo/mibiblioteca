Rails.application.routes.draw do
  resources :biblioteca
  root 'biblioteca#index'
end
