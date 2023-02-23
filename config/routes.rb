Rails.application.routes.draw do

  devise_for :users,
    path: '',
    path_names: {
      sign_up: '',
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup', 
    },
    controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
  devise_scope :user do
    get 'users/account/edit' => 'users/registrations#edit'
  end

  root 'top#index'

  resources :users, only: [:edit, :update] do
    member do
      get :account
      get :profile
    end
  end

  resources :rooms do
    collection do
      get :own
    end
  end

  resources :reservations do
    member do
      post :edit_confirm
    end
    collection do
      post :new_confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
