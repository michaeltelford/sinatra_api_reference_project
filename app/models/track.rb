# frozen_string_literal: true

# Track model.
class Track < ActiveRecord::Base
  belongs_to :album
end
