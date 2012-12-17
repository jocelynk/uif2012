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
    [Department, Program, Event, Section, SectionEvent, Attendance, Guardian, Household, Location, Enrollment, Student, StudentAllergy].each(&:delete_all)
   
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
    
    locations = {"UIF - Union Place" => "801 Union Place;15212", "Carnegie Mellon" => "5000 Forbes Avenue;15213", "Convention Center" => "1000 Fort Duquesne Blvd;15222", "Point State Park" => "101 Commonwealth Place;15222"}
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
      
    # Step 2: Add Some Programs for each Department and add Sections to Programs
    dept_ids = Department.all.map(&:id)
    programs = [
      ['Performing Arts Academy',1,1,12,false],['Urban Impact Choir',1,6,12,true],['Urban Impact Children\'s Choir',1,1,5,true],['Urban Impact Singers',1,8,12, false],['Urban Impact Shakes',1,8,12,false],
      ['Intramural Basketball',2,1,12,false],['High School Travel Basketball Teams',2,9,12,false],['Middle School Travel Basketball Teams',2,6,8,false],['Boys HS & MS Basketball Leagues',2,6,12,false],['Baseball',2,1,8,false],['Soccer',2,1,8,false],
      ['SAT Classes',3,10,12,false],['Summer Day Camp',3,1,12,false]
    ]
    programs.each do |program|
      p = Program.new
      p.name = program[0]
      p.department_id = program[1]
      p.description = Populator.sentences(2..10)
      p.max_capacity = (60..100).step(5).to_a.sample
      p.min_grade = program[2]
      p.max_grade = program[3]
      p.scan_by_absence = program[4]
      not_active = rand(10)
      if not_active.zero?
        p.active = false
      else
        p.active = true
      end
      p.start_date = (2.years.ago.to_date..3.months.ago.to_date).to_a.sample
      if p.active
        p.end_date = nil
      else
        p.end_date = (2.months.ago.to_date..2.days.ago.to_date).to_a.sample
      end
      p.save!
    end


    #Step 3 Create Sections
    prg_ids = Program.all.map(&:id)
    prg_ids.each do |p_id|
      s1 = Section.new
      if Program.find(p_id).department_id == 2
        s1.name = "Novice"
      elsif Program.find(p_id).name == "Performing Arts Academy"
        s1.name = "Music"
      else
        s1.name = "Main"
      end
      s1.active = true
      s1.max_capacity = (20..60).step(5).to_a.sample
      s1.program_id = p_id
      s1.save!
      
      if p_id%2==0
        s2 = Section.new
        if Program.find(p_id).department_id == 2
          s2.name = "Intermediate"
        elsif Program.find(p_id).name == "Performing Arts Academy"
          s2.name = "Drama"
        else
          s2.name = "Secondary"
        end
        s2.active = true
        s2.max_capacity = (20..60).step(5).to_a.sample
        s2.program_id = p_id
        s2.save!
      end
      if p_id%4==0
        s3 = Section.new
        if Program.find(p_id).department_id == 2
          s3.name = "Advanced"
        elsif Program.find(p_id).name == "Performing Arts Academy"
          s3.name = "Dancing"
        else
          s3.name = "Tertiary"
        end
        s3.active = true
        s3.max_capacity = (20..60).step(5).to_a.sample
        s3.program_id = p_id
        s3.save!
      end
    end

    
    #Step 4 Create Events and SectionEvents
    program_info = Program.joins(:sections).select('programs.id as program, sections.id as section, programs.start_date as start_date, programs.end_date as end_date, programs.active as pro_active')
    location_ids = Location.all.map(&:id)
    Event.populate 20 do |event|
      random_program = program_info.sample()
      if(random_program.pro_active)
        event.date = (random_program.start_date..Date.today).to_a.sample.to_date
      else
        event.date = (random_program.start_date..random_program.end_date).to_a.sample.to_date
      end
      
      event.program_id = random_program.program
      event.location_id = location_ids.sample
      start_hour = (11..18).to_a.sample
      start_month = (event.date.month..12).to_a.sample
      start_day = (event.date.day..30).to_a.sample
      event.start_time = Time.local(event.date.year,start_month,start_day,start_hour,0,0)
      event.end_time = Time.local(event.date.year,start_month,start_day,start_hour+3,0,0)
      event.bibles_distributed = Populator.value_in_range(0..60)
      event.gospel_shared = true
      event.meals_served = Populator.value_in_range(0..60)
      
      SectionEvent.populate 1 do |sectionevent|
        sectionevent.event_id = event.id
        sectionevent.section_id = random_program.section
      end
    end

    statuses = %w[College Active Unactive Graduated Missing ]
    #Step 5 Add Households and Students to Household
    Household.populate 100 do |household|
      household.name = Faker::Name.last_name
      household.street = Faker::Address.street_address
      if rand(4).zero?
        household.street2 = Faker::Address.street_address
      end
      household.zip = ['15212','15213','15233','15214','15136','15222','15219','15201','15204','15220','15203','15224']
      household.city = "Pittsburgh"
      household.church = Populator.words(1).titleize
      household.insurance_company = Populator.words(1..2).titleize
      household.insurance_number = rand(8**8).to_s.rjust(8, '0')
      not_active = rand(5)
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
        student.barcode_number = rand(12 ** 12).to_s.chop.rjust(12,'0')
        can_text = rand(5)
        if can_text.zero?
          student.can_text = false
        else
          student.can_text = true
        end
        unless rand(3).zero?
          student.cell_phone = "412" + rand(10 ** 10).to_s.rjust(10,'0')[0..6] 
        end
        student.date_of_birth = (22.years.ago.to_date..15.years.ago.to_date).to_a.sample
        student.email = "#{student.first_name.downcase}.#{student.last_name.downcase}@example.com"
        male = rand(4)
        if male.zero?
          student.is_male = false
        else
          student.is_male = true
        end
        student.status = statuses.to_a.sample
        student.is_visitor = false
      end
    end  
    
    
    #Step 6 Create Enrollments
    section_ids = Section.all.map(&:id)
    student_ids = Student.all.map(&:id)
    student_ids.each do |student|
        n = (1..2).to_a.sample 
        Enrollment.populate n do |enrollment|
            enrollment.student_id = student
            enrollment.section_id = section_ids.sample
                
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
           guardian.cell_phone = "412" + rand(10 ** 10).to_s.rjust(10,'0')[0..6] 
           can_text = rand(5)
           if can_text.zero?
             guardian.can_text = false
           else
             guardian.can_text = true
           end
           guardian.email = "#{guardian.first_name.downcase}.#{guardian.last_name.downcase}@example.com"
           guardian.active = true
        end
    end
    
   
 

  end
end
