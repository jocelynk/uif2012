FactoryGirl.define do
  factory :department do
    name "Peforming Arts"
    description "Programs for children interested in performing arts"
    active true
  end
    
  factory :program do
    association :department
    name "Choir"
    description "Children who sing"
    max_capacity 60
    max_grade 12
    min_grade 6
    active true
  end
  
  factory :team do
    name "HS Choir"
    max_capacity 20
    active true
  end
  
  factory :event do
    association :program
    association :location
    date Date.today
    start_time Time.local(2012,1,1,11,0,0)
    end_time Time.local(2012,1,1,14,0,0)
    meals_served 100
    gospel_shared true
    bibles_distributed true
  end

  factory :location do
    city "Pittsburgh"
    state "PA"
    zip "15213"
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    active true
  end

  
  
