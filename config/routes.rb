Rails.application.routes.draw do
  post  '/signup',  to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'

  resources :users do
    resources :appointments
  end
  
  resources :counselings do
    resources :appointments
  end
end
