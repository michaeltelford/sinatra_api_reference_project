# frozen_string_literal: true

module Relations
  class Albums < ROM::Relation[:sql]
    schema(infer: true)
  end
end
