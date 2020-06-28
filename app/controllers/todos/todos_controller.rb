class Todos::TodosController < ApplicationController
  def create
    respond_to do |format|
      format.json { render json: {} }
    end
  end
end
