Rails.application.routes.draw do
  devise_for :users
  root to: 'dogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :reviews
  end
end
