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
          expect(response).to have_http_status(:no_content)
          expect(response.header['Location']).to eq("/todos/#{new_todo.uuid}")
          expect(Todos::Todo.count).to eq(1)
          expect(new_todo.uuid).to match(/[A-Za-z0-9]{8}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{12}/)
          expect(new_todo.title).to eq('Complete this feature')
          expect(new_todo.description).to eq('Need to complete this feature now!')
        end
      end
    end

    context 'when invalid input is provided' do
      context 'when title is blank' do
        it 'returns a bad request' do
          params = {
            todos: {
              description: 'Need to complete this feature now!',
            }
          }

          expected_response = {
            errors: [
              { field: :title, code: :blank, title: "can't be blank" }
            ]
          }.to_json

          post('/todos', params: params, as: :json)

          aggregate_failures do
            expect(response).to have_http_status(:bad_request)
            expect(response.body).to eq(expected_response)
          end
        end
      end
    end
  end
end
