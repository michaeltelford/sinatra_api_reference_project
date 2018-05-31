# App routes and controllers.
class App < Sinatra::Base
  get '/healthcheck' do
    200
  end

  get '/' do
    "hello world"
  end
end
