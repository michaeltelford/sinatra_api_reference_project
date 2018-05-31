require 'dotenv'
require 'thin'
require 'sinatra/base'
require_relative 'helpers'

# App init, place any initialisation/configuration code below...
class App < Sinatra::Base
  Dotenv.load # load .env file into ENV
  require 'byebug' unless production?

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  configure :development, :production do
    set :server, 'thin'
    enable :logging
  end

  helpers Helpers
end
  
require_relative 'routes'
