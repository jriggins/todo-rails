require 'rails_helper'

RSpec.describe Samples::SamplesController do
  context 'GET /samples' do
    it 'returns a 200' do
      get('/samples', as: :json)

      expect(response).to have_http_status(:ok)
    end

    it 'matches content' do
      get('/samples', as: :json)

      expected = {
        status: :ok
      }.to_json

      expect(response.body).to eq(expected)
    end
  end
end
