Rails.application.routes.draw do
  root to: 'products#home'
  get 'pages/home'
  devise_for :users
  
  resources :products do
    resources :reviews,  :except => [:index]
  end
end
