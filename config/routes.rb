Rails.application.routes.draw do
  post  '/signup',  to: 'users#create'
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  resources :users do
    resources :appointments
  end
  resources :counselings do
    resources :appointments
  end
end
