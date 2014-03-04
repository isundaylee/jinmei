require 'bundler/capistrano'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/jinmei"

set :repository, 'https://github.com/isundaylee/jinmei.git'

server "root@211.136.168.38:8765", :app, :web, :db, :primary => true
