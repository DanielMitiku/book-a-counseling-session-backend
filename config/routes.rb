Rails.application.routes.draw do
  post  '/signup',  to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'

  resources :users do
    resources :appointments
  end

  get '/all_appointments', to: 'appointments#all'

  resources :counselings
end
