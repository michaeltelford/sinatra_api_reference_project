# frozen_string_literal: true

require 'rake/testtask'
require 'dotenv/tasks'
require 'pg'
require 'active_record'
require_relative 'app/helpers'

include ActiveRecord::Tasks

class Seeder
  def initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file '#{@seed_file}' does not exist" unless File.file?(@seed_file)
    load @seed_file
  end
end

root = File.expand_path '..', __FILE__
DatabaseTasks.env = ENV['ENV'] || 'development'
# DatabaseTasks.database_configuration = YAML.load(File.read(File.join(root, 'config/database.yml')))
DatabaseTasks.db_dir = File.join root, 'db'
DatabaseTasks.fixtures_path = File.join root, 'test/fixtures'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
DatabaseTasks.seed_loader = Seeder.new File.join root, 'db/seeds.rb'
DatabaseTasks.root = root

task :environment do
  Helpers.connect_to_database
end

load 'active_record/railties/databases.rake'

DEFAULT_DEV_PORT = 8080
DEFAULT_PROD_PORT = 80

task default: :help

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'app'
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
  if !ENV['DB_PORT'] || !ENV['DEV_PORT']
    print 'Required ENV vars: DB_PORT, DEV_PORT'
  else
    system 'docker-compose up'
  end
end
