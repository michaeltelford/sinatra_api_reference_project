# frozen_string_literal: true

# Healthcheck endpoint.
class App < Sinatra::Base
  # Healthcheck handler.
  get '/healthcheck' do
    200
  end
end
