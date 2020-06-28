require 'rails_helper'

RSpec.describe Todos::CreateController, type: :request do
  describe 'POST /todos' do
    context 'when valid input is provided' do
      it 'creates a Todo' do
        params = {
          todos: {
            title: 'Complete this feature',
            description: 'Need to complete this feature now!',
          }
        }
        post('/todos', params: params, as: :json)

        expect(response.status).to eq(204)
        expect(response.header['Location']).to eq('/todos/1')
        expect(Todos::Todo.count).to eq(1)
        expect(Todos::Todo.last.uuid).to eq('ee035c26-22da-4a2f-9204-78b2ab81232d')
        expect(Todos::Todo.last.title).to eq('Complete this feature')
        expect(Todos::Todo.last.description).to eq('Need to complete this feature now!')
      end
    end

    context 'when invalid input is provided'
  end
end
