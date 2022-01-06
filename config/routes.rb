Rails.application.routes.draw do
  resources :training_sessions, except: [:update, :destroy]
  resources :skills, except: [:update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
