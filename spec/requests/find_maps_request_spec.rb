require 'rails_helper'

RSpec.describe FindMapsController do
  describe("GET /maps/bellevue/path/b/a") do
    context 'with available maps' do
      it 'find the shortest path' do
        get('/maps/bellevue/path/b/a', as: :json)

        expected = { "distance": 10.0, "path": ["b", "c", "a"] }.to_json

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(expected)
      end
    end
  end

  describe("GET /maps/sf/path/a/b") do
    context 'with available maps' do
      it 'find the shortest path' do
        get('/maps/sf/path/a/b', as: :json)

        expected = { "distance": 1.0, "path": ["a", "b"] }.to_json

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(expected)
      end
    end
  end
end
