module Todos
  class CreateController < ApplicationController
    def create
      create_todo(create_params)

      respond_to do |format|
        format.json { render json: {} }
      end
    end

    private

    def create_params
      params.permit(:title, :description)
    end

    def create_todo(params)
      CreateTodo.new(repository: Todo).call(params: params)
    end
  end

  class CreateTodo
    def initialize(repository:)
      @repository = repository
    end

    def call(params:)
      @repository.create!(params)
    end
  end
end
