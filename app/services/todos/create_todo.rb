
module Todos
  class CreateTodo
    include ::Dry::Monads[:result, :try]

    def initialize(repository:, uuid_factory:)
      @repository = repository
      @uuid_factory = uuid_factory
    end

    def call(input:)
      Try {
        validate(input)
          .or { |errors| validation_failure(errors) }
          .bind { |validated_input| create_todo(validated_input) }
      }.value_or {|e| failure_response(e)}
    end

    private

    def validation_failure(errors)
      validation_errors = errors.reduce([]) do |result, error|
        field, title = *error
        result << { field: field, title: title }
      end

      Failure(validation_errors)
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
