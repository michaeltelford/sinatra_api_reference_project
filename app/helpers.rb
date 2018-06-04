# frozen_string_literal: true

# Helpers module for app and route helper funcs.
# Some funcs are used by Rake as well.
module Helpers
  # Connects to the DB or throws an exception.
  # ActiveRecord then holds the connection (globally).
  # The ENV is used if present, otherwise sensible defaults are applied. 
  def connect_to_database
    ActiveRecord::Base.establish_connection(
      adapter: ENV['DB_ADAPTER'] || 'postgresql',
      database: ENV['DB_DATABASE'] || 'postgres',
      host: ENV['DB_HOST'] || 'localhost',
      port: ENV['DB_PORT'] || 5432,
      username: ENV['DB_USERNAME'] || 'postgres',
      password: ENV['DB_PASSWORD'] || 'postgres'
    )
  end
end
