require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/rbenv"
require "capistrano/rails"
require "capistrano/bundler"
require "byebug"

require 'dotenv'
Dotenv.load

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/puma"
install_plugin Capistrano::Puma, load_hooks: false
install_plugin Capistrano::Puma::Systemd, load_hooks: false

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
