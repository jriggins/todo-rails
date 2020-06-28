require 'rails_helper'

RSpec.describe Todos::TodosController, type: :request do
  describe 'POST /todos' do
    context 'when valid input is provided' do
      it 'creates a Todo' do
        params = {
            title: 'Complete this feature',
            description: 'Need to complete this feature now!',
        }
        post('/todos', params: params, as: :json)

        expect(response.status).to eq(200)
        expect(Todos::Todo.count).to eq(1)
        expect(Todos::Todo.last.title).to eq('Complete this feature')
        expect(Todos::Todo.last.description).to eq('Need to complete this feature now!')
      end
    end

    context 'when invalid input is provided'
  end
end
