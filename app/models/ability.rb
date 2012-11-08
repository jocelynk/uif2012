class Ability
  include CanCan::Ability
  
  def initialize(user)
    # set user to new User if not logged in
    user ||= User.new # i.e., a guest user
    
    # set authorizations for different user roles
    if user.role? :admin
      # they get to do it all
      can :manage, :all

      
    elsif user.role? :checkin
      # can see a list of all students, households, programs, events
      can :index, Student
      can :index, Household
      can :index, Program
      can :index, Event
      
      # can see details of particular students, households, programs, events
      can :show, Student
      can :show, Household
      can :show, Program
      can :show, Event
      
      # can do other stuff (not sure what off top of my head...)
      # can :update, Stuff
      
      
      # they can read their own profile
      can :show, User do |u|  
        u.id == user.id
      end
      
      # they can update their own profile
      can :update, User do |u|  
        u.id == user.id
      end
    
    else
      # guests can only read ...
      can :index, Department
    end
  end
end