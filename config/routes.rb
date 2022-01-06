Rails.application.routes.draw do
  resources :training_sessions, except: [:update, :destroy] do
    get 'strongest_skill', on: :collection
  end

  resources :skills, except: [:update, :destroy] do
    get 'strong', on: :collection
  end
  
end
