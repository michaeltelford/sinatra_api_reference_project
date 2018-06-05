# frozen_string_literal: true

require_relative '../models/repositories/albums'

# Album resource endpoints.
class App < Sinatra::Base
  # List all albums.
  get '/album' do
    repo = Repositories::Albums.new(container)
    repo.list
  end
end
