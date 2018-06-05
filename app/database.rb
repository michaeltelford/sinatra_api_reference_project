# frozen_string_literal: true

# Database helpers module.
module Database
  # Connects to the DB or throws an exception.
  # The configured ROM container is returned.
  def self.connect
    ROM.container(Database.configure)
  end

  # Returns the ROM DB configuration.
  def self.configure
    ROM::Configuration.new(
      :sql,
      Database.connection_string,
      extensions: [:pg_json]
    )
  end

  # Returns a connection string used to connect to the DB with.
  def self.connection_string
    db = Database.connection_config
    "#{db[:adapter]}://#{db[:username]}:#{db[:password]}@#{db[:host]}:#{db[:port]}/#{db[:database]}"
  end

  # Returns a hash of database connection config.
  # The ENV is used if present, otherwise sensible defaults are applied.
  def self.connection_config
    {
      adapter: ENV['DB_ADAPTER'] || 'postgres',
      database: ENV['DB_DATABASE'] || 'postgres',
      host: ENV['DB_HOST'] || 'localhost',
      port: ENV['DB_PORT'] || 5432,
      username: ENV['DB_USERNAME'] || 'postgres',
      password: ENV['DB_PASSWORD'] || 'postgres'
    }
  end
end
