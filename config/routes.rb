T3::Application.routes.draw do
  resources :messages, except: [:destroy, :update]
end
