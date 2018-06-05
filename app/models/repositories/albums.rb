# frozen_string_literal: true

module Repositories
  # Albums repository.
  class Albums < ROM::Repository[:albums]
    def list
      albums.to_a
    end
  
    def by_id(id)
      albums.by_pk(id).one!
    end
  end
end
