
module Todos
  class CreateTodo
    include ::Dry::Monads[:result]

    def initialize(repository:, uuid_factory:)
      @repository = repository
      @uuid_factory = uuid_factory
    end

    def call(input:)
      todo = @repository.create!(uuid: @uuid_factory.call, title: input.title, description: input.description)
      Success(CreateTodoResponse.new(uuid: todo.uuid))
    rescue StandardError => e
      Failure(e)
    end
  end
end
