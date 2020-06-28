require 'rails_helper'

RSpec.describe Todos::TodosController, type: :request do
  describe 'POST /todos' do
    context 'when valid input is provided' do
      it 'creates a Todo' do
        params = {}
        post(todos_todos_path, params: params, as: :json)

        expect(response.status).to eq(200)
      end
    end

    context 'when invalid input is provided'
  end
end
