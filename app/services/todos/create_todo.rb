
module Todos
  class CreateTodo
    def initialize(repository:, uuid_factory:)
      @repository = repository
      @uuid_factory = uuid_factory
    end

    def call(input:)
      todo = @repository.create!(uuid: @uuid_factory.call, title: input.title, description: input.description)
      CreateTodoResponse.new(uuid: todo.uuid)
    end
  end
end
