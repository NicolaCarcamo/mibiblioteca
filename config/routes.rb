Rails.application.routes.draw do
  post 'biblioteca', to: 'biblioteca#index'
  root 'biblioteca#index'
end
