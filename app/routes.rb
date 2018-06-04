# App routes and controllers.
class App < Sinatra::Base
  
  

  # ActiveRecord::Schema.define do
  #   create_table :albums do |table|
  #       table.column :title, :string
  #       table.column :performer, :string
  #   end
  #   create_table :tracks do |table|
  #       table.column :album_id, :integer
  #       table.column :track_number, :integer
  #       table.column :title, :string
  #   end
  # end

  require_relative 'models'

  Album.create title: '18', performer: 'U2'

  get '/healthcheck' do
    200
  end

  get '/' do
    'hello world'
  end

  get '/album' do
    Album.first.title + ' by ' + Album.first.performer
  end
end
