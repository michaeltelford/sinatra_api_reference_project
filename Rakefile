require 'rake/testtask'
require 'dotenv/tasks'

DEFAULT_DEV_PORT = 8080
DEFAULT_PROD_PORT = 80

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test

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
  if not ENV['POSTGRES_PORT'] or not ENV['DEV_PORT']
    print "Required .env vars: POSTGRES_PORT, DEV_PORT"
  else
    system "docker-compose up"
  end
end
