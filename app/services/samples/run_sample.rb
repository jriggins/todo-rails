# frozen_string_literal: true

module Samples
  class RunSample
    include ::Dry::Monads[:result]

    def call
      Success()
    end
  end
end
