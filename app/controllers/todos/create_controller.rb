module Todos
  class CreateController < ApplicationController
    def create
      Todo.create!(create_params)

      respond_to do |format|
        format.json { render json: {} }
      end
    end

    def create_params
      params.permit(:title, :description)
    end
  end
end
