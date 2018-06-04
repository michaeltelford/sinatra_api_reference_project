# frozen_string_literal: true

require 'rake/testtask'
require 'dotenv/tasks'

DEFAULT_DEV_PORT = 8080
DEFAULT_PROD_PORT = 80

task default: :help

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Display task descriptions'
task :help do
  system 'bundle exec rake -T'
end

desc "Start the app in dev on ENV['DEV_PORT'] or port #{DEFAULT_DEV_PORT}"
task serve: :dotenv do
  port = ENV['DEV_PORT'] || DEFAULT_DEV_PORT
  system "RACK_ENV=development bundle exec rackup -p #{port}"
end

desc "Start the app in production on ENV['PORT'] or port #{DEFAULT_PROD_PORT}"
task serve!: :dotenv do
  port = ENV['PORT'] || DEFAULT_PROD_PORT
  system "RACK_ENV=production bundle exec rackup -p #{port}"
end

desc 'Open the app URL in a browser'
task :open do
  puts 'You may need to refresh the webpage to see the app...'
  port = ENV['DEV_PORT'] || DEFAULT_DEV_PORT
  system "open 'http://localhost:#{port}'"
end

desc 'Start app and open in browser'
task browse: [:open, :serve]

desc 'Load .env and run docker-compose up'
task up: :dotenv do
  if !ENV['DB_PORT'] or !ENV['DEV_PORT']
    print 'Required ENV vars: DB_PORT, DEV_PORT'
  else
    system 'docker-compose up'
  end
end

# Database specific tasks.
namespace :db do
  desc 'Establish a connection to the database'
  task :connect do
  end

  desc 'Create the database'
  task create_db: :connect do
  end

  desc 'Run data migrations'
  task migrate: :connect do
  end

  desc 'Seed development data'
  task seed: :connect do
  end

  desc 'Remove all tables in the database'
  task nuke: :connect do
  end
end
