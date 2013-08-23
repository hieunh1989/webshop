Webshop::Application.routes.draw do  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "pages#home"
  
  resources :users

  resources :products do
    collection do
      get :home
    end
  end

  resources :orders do 
    collection do
      get :make_payment
    end
  end

  namespace :admin do
    resources :users
    resources :products
    resources :comments
    resources :orders
  end
end
