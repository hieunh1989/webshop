Webshop::Application.routes.draw do  
  devise_for :users
  root "pages#home"

  resources :users

  resources :products do
    collection do
      get :home
    end
  end

  namespace :admin do
    resources :users
  end

  namespace :admin do
    resources :products
  end

  namespace :admin do
    resources :comments
  end

  namespace :admin do
    resources :orders
  end

end
