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

        new_todo = Todos::Todo.last

        aggregate_failures do
          expect(response.status).to eq(204)
          expect(response.header['Location']).to eq("/todos/#{new_todo.uuid}")
          expect(Todos::Todo.count).to eq(1)
          expect(new_todo.uuid).to match(/[A-Za-z0-9]{8}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{12}/)
          expect(new_todo.title).to eq('Complete this feature')
          expect(new_todo.description).to eq('Need to complete this feature now!')
        end
      end
    end

    context 'when invalid input is provided'
  end
end
