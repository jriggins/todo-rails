
class FindMapsController < ApplicationController
  def show
    respond_to do |format|
      format.json do
        if params[:map_id] == 'bellevue'
          render json: { "distance": 10.0, "path": ["b", "c", "a"] }
        elsif params[:map_id] == 'sf'
          render json: { "distance": 1.0, "path": ["a", "b"] }
        end
      end
    end
  end
end
