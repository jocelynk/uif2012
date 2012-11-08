Uif2012::Application.routes.draw do
 
  match 'checkin', :controller => 'home', :action => 'checkin'
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
  resources :sections
  resources :attendances
  resources :locations
  resources :events
  resources :programs
  resources :departments
  resources :registrations
  resources :section_events
  
  #Root url
  root :to => 'home#index'
  
  # Authentication routes
  resources :users
  resources :sessions
  match 'register' => 'users#new', :as => :register
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

end
