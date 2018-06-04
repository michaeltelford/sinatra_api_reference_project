# frozen_string_literal: true

require_relative '../models/album'

# Album endpoints.
class App < Sinatra::Base
  # List all albums.
  get '/album' do
    Album.first.title + ' by ' + Album.first.performer
  end
end
