#require "rvm/capistrano"
#$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.

#set :default_environment, {
#  'PATH' => "/home/deploy/.rvm/rubies/ruby-1.9.3-p392/bin/:$PATH"
#}


#set :bundle_cmd, "/home/deploy/.rvm/gems/ruby-1.9.3-p392@global/bin/bundle"
#set :bundle_dir, "/home/deploy/.rvm/gems/ruby-1.9.3-p392"

#set :default_environment, {
#    'PATH' => "/usr/local/bin:/bin:/usr/bin:/bin:/home/deploy/.rvm/rubies/ruby-1.9.3-p392/bin",
#    'GEM_HOME' => '/home/deploy/.rvm/gems/ruby-1.9.3-p392',
#    'GEM_PATH' => '/home/deploy/.rvm/gems/ruby-1.9.3-p392:/home/deploy/.rvm/gems/ruby-1.9.3-p392@global',
#    :bundle_cmd => '/home/deploy/.rvm/gems/ruby-1.9.3-p392@global/bin/bundle'
#}

require "rvm/capistrano"
require "bundler/capistrano"

#require "bundler/capistrano"
set :application, "alijosapp"
set :repository,  "git@github.com:trestles/alijosapp.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.81.212.111"                          # Your HTTP server, Apache/etc
role :app, "192.81.212.111"                          # This may be the same as your `Web` server
role :db,  "192.81.212.111", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "deploy"
set :deploy_to, "/var-www/alijos"
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#set :default_environment, {
#  'PATH' => "/home/deploy/.rvm/rubies/ruby-1.9.3-p392/bin/:$PATH"
#}

#set :default_environment, {
#    'PATH' => "/usr/local/bin:/bin:/usr/bin:/bin:/home/deploy/.rvm/rubies/ruby-1.9.3-p392/bin",
#    'GEM_HOME' => '/home/deploy/.rvm/gems/ruby-1.9.3-p392',
#    'GEM_PATH' => '/home/deploy/.rvm/gems/ruby-1.9.3-p392:/home/deploy/.rvm/gems/ruby-1.9.3-p392@global',
#    :bundle_cmd => '/home/deploy/.rvm/gems/ruby-1.9.3-p392@global/bin/bundle'  
#}
