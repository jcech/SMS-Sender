T3::Application.routes.draw do
  devise_for :users
  resources :messages, except: [:destroy, :update]
  resources :contacts
end
