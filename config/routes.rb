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
  
  resources :users
  resources :rooms do
    resources :reservations
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
