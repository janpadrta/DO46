Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|de/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    resources :password_resets

    get 'logout' => 'sessions#destroy', :as => 'logout'
    get 'login' => 'sessions#new', :as => 'login'
    get 'signup' => 'users#new', :as => 'signup'

    resources :users do
      member do
        get :activate
      end
    end

    resources :sessions

    root to: 'users#show_me'
  end
end
