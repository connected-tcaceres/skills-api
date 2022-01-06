Rails.application.routes.draw do
  resources :training_sessions, except: [:update, :destroy]
  resources :skills, except: [:update, :destroy] do
    get 'strong', on: :collection
  end
end
