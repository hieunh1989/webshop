Webshop::Application.routes.draw do  
  devise_for :users
  root "pages#home"

  get "/oauth/redirect" => "oauth#redirect"

  resources :users
  resources :products do
    collection do
      get :home
    end
  end

  namespace :admin do
    resources :users
    resources :products
    resources :comments
    resources :orders
  end

end
