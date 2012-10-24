Uif2012::Application.routes.draw do
  
  match 'home' => 'home#index', :as => :home
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'home#contact', :as => :contact
  match 'search' => 'home#search', :as => :search

  #Generated model routes
  resources :allergies
  resources :guardians
  resources :student_allergies
  resources :households
  resources :students
  resources :groups
  resources :attendences
  resources :locations
  resources :events
  resources :programs
  resources :departments
  resources :registrations
  
  #Root url
  root :to => 'home#index'
  
  # Authentication routes
  resources :users
  resources :sessions
  match 'register' => 'users#new', :as => :register
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

end
