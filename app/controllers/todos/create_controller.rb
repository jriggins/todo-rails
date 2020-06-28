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
      Container['create_todo']
        .call(input: CreateTodoInput.from_hash(hash: params))
    end
  end
end
