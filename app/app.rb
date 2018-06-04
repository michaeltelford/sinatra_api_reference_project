require 'dotenv'
require 'thin'
require 'sinatra/base'
require 'pg'
require 'active_record'
require_relative 'helpers'

# App init, place any initialisation/configuration code below...
class App < Sinatra::Base
  Dotenv.load # load .env file into ENV

  configure :development do
    require 'byebug'
    require 'sinatra/reloader'
    
    register Sinatra::Reloader
  end

  configure :development, :production do
    set :server, 'thin'
    enable :logging
  end

  ActiveRecord::Base.establish_connection(
    adapter: ENV['DB_ADAPTER'] || 'postgresql',
    database: ENV['DB_DATABASE'] || 'postgres',
    host: ENV['DB_HOST'] || 'localhost',
    port: ENV['DB_PORT'] || 5432,
    username: ENV['DB_USERNAME'] || 'postgres',
    password: ENV['DB_PASSWORD'] || 'postgres'
  )

  helpers Helpers
end
  
require_relative 'routes'
