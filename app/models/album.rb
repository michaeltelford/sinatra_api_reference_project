# frozen_string_literal: true

# Album model.
class Album < ActiveRecord::Base
  has_many :tracks
end
