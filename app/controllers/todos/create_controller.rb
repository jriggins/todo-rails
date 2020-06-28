module Todos
  class CreateController < ApplicationController
    def create
      todo = create_todo(create_params)

      respond_to do |format|
        format.json { render status: :no_content, location: "/todos/#{todo.id}" }
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
        .new(repository: Todo, uuid_factory: ->() { 'ee035c26-22da-4a2f-9204-78b2ab81232d' }) # TODO: Fix
        .call(input: CreateTodoInput.from_hash(hash: params))
    end
  end
end
