#
# Provide better logging output for Capistrano
#

require 'colored'

STDOUT.sync
logger.level = Capistrano::Logger::IMPORTANT # less logging output

before 'deploy:update_code' do
  print '-----> Updating codebase'
end

after  'deploy:update_code' do
  puts ' ✔'.green
end

