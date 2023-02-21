Rails.application.routes.draw do

  devise_for :users,
    path: '',
    path_names: {
      sign_up: '',
      sign_in: 'login',
      sign_out: 'logout',
      registration: "signup",
    },
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
  
  root "top#index"
  
  get "users/profile" => "users#profile"
  get "users/profile/edit" => "users#edit" 
  get "users/account" => "users#account"
  get "users/account/edit" => "users/registrations#edit"
  get "rooms/own" => "rooms#own"

  resources :rooms do
    resources :reservations
    match "reservations/confirm", to: "reservations#new", via: "post"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
