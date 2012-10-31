namespace :maintenance do
  desc "Run scheduled tasks"
  # creating a rake task within schedule maintenance called 'event'
  # executing 'rake maintenance:' will cause this script to run
  task :event => :environment do
    # Invoke rake db:migrate just in case...
    Rake::Task['maintenance:event'].invoke
    
  
 
  end
end
