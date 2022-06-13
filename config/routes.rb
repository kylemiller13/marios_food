Rails.application.routes.draw do
  root to: 'products#home'
  
  resources :products do
    resources :reviews,  :except => [:index]
  end
end
