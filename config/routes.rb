Uif2012::Application.routes.draw do
  
  resources :groups

  resources :attendences

  resources :locations

  resources :events

  resources :programs

  resources :departments

  resources :registrations

end
