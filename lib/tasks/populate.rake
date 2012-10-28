namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Invoke rake db:migrate just in case...
    Rake::Task['db:migrate'].invoke
    
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    
    # Step 0: clear any old data in the db
    [Department, Program, Event, Section, SectionEvent, Attendance, Guardian, Household, Location, Registration, Student, StudentAllergy].each(&:delete_all)
   
    # Step 1: Add Departments
    pa = Department.new
    pa.name = "Performing Arts"
    pa.description = "The Performing Arts Program gives children, middle school and high school youth the opportunity to share their talents by singing, dancing, and acting in venues across the country."
    pa.active = true
    pa.save!
    at = Department.new
    at.name = "Athletics"
    at.description = "Depending on the night of the week and the time of the year, chances are there is a sports program going on where kids are having fun and learning about the Lord." 
    at.active = true
    at.save!
    aa = Department.new
    aa.name = "Academic Assistance"
    aa.description = "Urban Impact offers academic remediation both during the school year and throughout the summer. Program directors encourage youth to stop by for a visit after school for homework help, while highschoolers may attend the SAT Prep Class."
    aa.active = true
    aa.save!
    
     # Step 2: Add some Locations
    
    locations = {"Carnegie Mellon" => "5000 Forbes Avenue;15213", "Convention Center" => "1000 Fort Duquesne Blvd;15222", "Point State Park" => "101 Commonwealth Place;15222"}
    locations.each do |location|
      loc = Location.new
      loc.name = location[0]
      street, zip = location[1].split(";")
      loc.street = street
      loc.city = "Pittsburgh"
      loc.zip = zip
      loc.active = true
      loc.save!
    end
      
    # Step 2: Add Some Programs for each Department and add Events to Programs
    dept_ids = Department.all.map(&:id)
    location_ids = Location.all.map(&:id)
    Program.populate 12 do |program|
      num = Populator.value_in_range(1..11)
      num1 = num+1
      range = num1..12
      program.department_id = dept_ids.sample
      program.name = Populator.words(1..3).titleize
      program.description = Populator.sentences(2..10)
      program.max_capacity = Populator.value_in_range(60..100)
      program.max_grade = Populator.value_in_range(range)
      program.min_grade = num
      not_active = rand(5)
      if not_active.zero?
        program.active = false
      else
        program.active = true
      end
      program.start_date = (2.years.ago.to_date..3.months.ago.to_date).to_a.sample
      if program.active
        program.end_date = nil
      else
        program.end_date = (2.months.ago.to_date..2.days.ago.to_date).to_a.sample
      end

  
       Event.populate 3 do |event|
         if(program.active)
           event.date = (program.start_date..Date.today).to_a.sample
         else
           event.date = (program.start_date..program.end_date).to_a.sample
         end
        
         event.program_id = program.id
         event.location_id = location_ids.sample
         start_hour = (11..18).to_a.sample
         start_month = (event.date.month..12).to_a.sample
         start_day = (event.date.day..30).to_a.sample
         event.start_time = Time.local(event.date.year,start_month,start_day,start_hour,0,0)
         event.end_time = Time.local(event.date.year,start_month,start_day,start_hour+3,0,0)
         event.bibles_distributed = true
         event.gospel_shared = true
         event.meals_served = Populator.value_in_range(40..60)
     

       end
      
    end
    statuses = %w[College Active Unactive Graduated Missing ]
    #Step 3 Add Households and Students to Household
    Household.populate 100 do |household|
      household.name = Faker::Name.last_name
      household.street = Faker::Address.street_address
      household.street2 = Faker::Address.street_address
      household.zip = Faker::Address.zip_code
      household.city = Faker::Address.city
      household.church = Populator.words(1).titleize
      household.insurance_company = Populator.words(1..2).titleize
      household.insurance_number = rand(8**8).to_s.rjust(8, '0')
      not_active = rand(4)
      if not_active.zero?
        household.active = false
      else
        household.active = true
      end
     
     n = (1..2).to_a.sample 
     Student.populate n do |student|
        student.first_name = Faker::Name.first_name
        student.last_name = household.name
        student.grade = (1..12).to_a.sample
        student.household_id = household.id
        student.barcode_number = rand(12 ** 12).to_s.rjust(12,'0').chop
        can_text = rand(5)
        if can_text.zero?
          student.can_text = false
        else
          student.can_text = true
        end
        student.cell_phone = Faker::PhoneNumber.phone_number 
        student.date_of_birth = (22.years.ago.to_date..15.years.ago.to_date).to_a.sample
        student.email = Faker::Internet.email
        male = rand(4)
        if male.zero?
          student.is_male = false
        else
          student.is_male = true
        end
        student.status = statuses.to_a.sample
       
      end
    end  
    #Step 4 Create Sections

    program_ids = Program.all.map(&:id)
    Section.populate 24 do |section|
        section.name = Populator.words(1..3).titleize
        section.active = true
        section.max_capacity = Populator.value_in_range(20..60)
        section.program_id = program_ids.sample
    end
    
    #Step 5 Create Registrations
    section_ids = Section.all.map(&:id)
    student_ids = Student.all.map(&:id)
    student_ids.each do |student|
        n = (1..2).to_a.sample 
        Registration.populate n do |registration|
            registration.student_id = student
            registration.section_id = section_ids.sample
                
        end
    end
    
    #Step 6 Create Allergies
    Allergy.populate 20 do |allergy|
        allergy.name = Populator.words(1..3).titleize
        allergy.warning_text = Populator.sentences(1..3)
        allergy.active = true
    end
    
    allergy_ids = Allergy.all.map(&:id)
    student_ids = Student.all.map(&:id)
    StudentAllergy.populate 100 do |studentallergy|
        studentallergy.allergy_id = allergy_ids.sample
        studentallergy.student_id = student_ids.sample
    end
    
    #Step 7 Create Guardians
    household_ids = Household.all.to_a.each_with_object({}){ |household,h| h[household.id] = household.name }

    types = %w[Custodial Uncustodial Grandparent Father Mother]
    household_ids.each do |k,v|
        n = (1..2).to_a.sample
        Guardian.populate n do |guardian|
           guardian.first_name = Faker::Name.first_name
           guardian.last_name = v
           guardian.household_id = k
           guardian.guardian_type = types.to_a.sample
           guardian.cell_phone = Faker::PhoneNumber.phone_number 
           can_text = rand(5)
           if can_text.zero?
             guardian.can_text = false
           else
             guardian.can_text = true
           end
           guardian.email = Faker::Internet.email
           guardian.active = true
        end
    end
    
    #Step 8 Create SectionEvents

     se_ids = Program.joins(:sections, :events).select('programs.id as program, sections.id as section, events.id as event')
     se_ids.each do |obj|
        se = SectionEvent.new
        se.event_id = obj.event
        se.section_id = obj.section
        se.save!
     end
     
     att_ids = Program.joins({:sections => [{:registrations => [:student]}]}, :events).select('programs.id as program, students.id as student, events.id as event')

     att_ids.each do |obj|
        att = Attendance.new
        att.event_id = obj.event
        att.student_id = obj.student
        exempt = rand(5)
           if exempt.zero?
             att.exempt = false
           else
             att.exempt = true
           end
        att.save!
     end
 

  end
end
