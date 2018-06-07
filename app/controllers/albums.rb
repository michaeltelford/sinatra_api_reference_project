# frozen_string_literal: true

require_relative '../models/repositories/albums'

# Album resource endpoints.
class App < Sinatra::Base
  # List all albums.
  get '/albums' do
    repo = Repositories::Albums.new(@@container)
    [200, {}, [repo.list.count.to_s]]
  end
end
