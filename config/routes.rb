Uif2012::Application.routes.draw do
  devise_for :users

  #require 'api_constraints' 
  match 'checkin', :controller => 'home', :action => 'checkin'
  match 'meals_served', :controller => 'event', :action => 'meals_served'
  match 'home' => 'home#index', :as => :home
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'home#contact', :as => :contact
  match 'privacy' => 'home#privacy', :as => :privacy
  match 'search' => 'home#search', :as => :search

  #mobile routes
  resources :tokens,:only => [:create, :destroy]
  match 'getToken' => 'tokens#create', :via => :post
  match 'destroyToken' => 'tokens#destroy', :via => :delete
  match 'ajax_allergies' => 'allergies#ajax_allergies', :via => :get
  match 'getTodaysEvents' => 'mobile#getTodaysEvents', :via => :get
  match 'createAttendances' => 'mobile#createAttendances', :via => :post
  

  #Generated model routes
  resources :allergies
  resources :guardians
  resources :student_allergies
  resources :households
  resources :students
  resources :sections
  resources :attendances
  resources :locations
  resources :events do
    get 'meals_served', :on => :member
  end
  resources :programs
  resources :departments
  resources :enrollments
  resources :section_events
  
  #Root url
  root :to => 'home#index'
  
  # Authentication routes
  resources :users
  #resources :sessions
  #match 'register' => 'users#new', :as => :register
 # match 'logout' => 'sessions#destroy', :as => :logout
  #match 'login' => 'sessions#new', :as => :login

end
