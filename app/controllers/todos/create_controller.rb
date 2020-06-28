module Todos
  class CreateController < ApplicationController
    def create
      create_todo(create_params).fmap do |output|
        respond_to do |format|
          format.json { render status: :no_content, location: "/todos/#{output.uuid}" }
        end
      end
    end

    private

    def create_params
      params
        .require(:todos)
        .permit(:title, :description)
    end

    def create_todo(params)
      CreateTodo
        .new(repository: Todo, uuid_factory: Utils::GenerateUuid.new)
        .call(input: CreateTodoInput.from_hash(hash: params))
    end
  end
end
