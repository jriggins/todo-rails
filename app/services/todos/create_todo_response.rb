
module Todos
  class CreateTodoResponse
    attr_reader :uuid

    def initialize(uuid:)
      @uuid = uuid
    end
  end
end
