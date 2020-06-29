
module Todos
  class CreateTodo
    include ::Dry::Monads[:result]

    def initialize(repository:, uuid_factory:)
      @repository = repository
      @uuid_factory = uuid_factory
    end

    def call(input:)
      validate(input)
        .or { |errors| validation_failure(errors) }
        .bind { |validated_input| create_todo(validated_input) }
    rescue StandardError => e
      failure_response(e)
    end

    private

    def validation_failure(errors)
      Failure(errors)
    end

    def create_todo(input)
      Success(@repository.create!(uuid: @uuid_factory.call, title: input.title, description: input.description))
        .bind { |todo| create_response(todo) }
    end

    def validate(input)
      input.valid? ? Success(input) : Failure(input.errors)
    end

    def create_response(todo)
      Success(CreateTodoResponse.new(uuid: todo.uuid))
    end

    def failure_response(e)
      Failure(e)
    end
  end
end
