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

namespace :deploy do
  desc 'Start Puma service on server'
  task :restart do
    on roles(:web) do
      execute("sudo /bin/systemctl restart puma_blog_staging")
    end
  end

  desc 'Execute a custom rake task being passed as an input'
  task :custom_task, [:task] do |t, args|
    raise ArgumentError.new('A rake task name is required') if args.blank?

    on roles(:web) do
      invoke(args[:task])
    end
  end
end
