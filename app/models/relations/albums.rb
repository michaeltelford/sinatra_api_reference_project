# frozen_string_literal: true

class Albums < ROM::Relation[:sql]
  schema(infer: true)
end
