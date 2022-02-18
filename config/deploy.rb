set :repo_url,        'git@github.com:ketan-cardup/blog.git'
set :application,     'blog'
set :user,            'deploy'
set :branch,          'main'
set :puma_threads,    [4, 16]
set :puma_workers,    0

set :pty, true
set :use_sudo, true
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
