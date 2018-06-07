# frozen_string_literal: true

require 'dotenv'
require 'thin'
require 'sinatra/base'
require 'pg'
require 'rom'
require 'rom-sql'
require 'rom-repository'
require_relative 'database'
require_relative 'helpers'

# App init, place any initialisation/configuration code below...
class App < Sinatra::Base
  Dotenv.load # Load .env file vars into the ENV.

  configure :development do
    require 'byebug'
    require 'sinatra/reloader'

    register Sinatra::Reloader
  end

  configure :development, :production do
    set :server, 'thin'
    enable :logging
  end

  helpers Helpers

  config = Database.configure
  
  # config.auto_registration(File.expand_path('models', __FILE__))
  require_relative 'models/relations/albums'
  config.register_relation(Relations::Albums)
  
  container = Database.connect(config)
  
  require_relative 'models/repositories/albums'
  repo = Repositories::Albums.new(container)

  @@container = container
end

require_relative 'routes'
