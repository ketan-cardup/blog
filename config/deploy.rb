set :repo_url,        'git@github.com:ketan-cardup/blog.git'
set :application,     'blog'
set :user,            'deploy'
set :branch,          'main'
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :pty, true
set :use_sudo, true
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :migration_role, :db
set :migration_servers, -> { release_roles(fetch(:migration_role)) }
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

desc "Start Puma service on server"
namespace :deploy do
  task :restart do
    on roles(:web) do
      execute("sudo /bin/systemctl restart puma_blog_staging")
    end
  end
end
