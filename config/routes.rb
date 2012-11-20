Uif2012::Application.routes.draw do
  devise_for :users

  require 'api_constraints' 
  match 'checkin', :controller => 'home', :action => 'checkin'
  match 'home' => 'home#index', :as => :home
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'home#contact', :as => :contact
  match 'search' => 'home#search', :as => :search

  
  namespace :api do
    namespace :v1  do
      resources :tokens,:only => [:create, :destroy]
    end
  end
  
  
  #namespace :api, defaults: {format: 'json'} do
    #scope module: :v1, constraints: ApiConstraints.new(version: 1) do
    #  resources :allergies
    #end
    #scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
    #  resources :allergies
   # end
  #end

  #Generated model routes
  resources :allergies
  match 'ajax_allergies' => 'allergies#ajax_allergies', :via => :get
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
