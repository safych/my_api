require 'swagger_helper'

RSpec.describe 'api/singers', type: :request do

  path '/singers' do

    post 'Create a singer' do
      tags 'Singers'
      consumes 'application/json'
      parameter name: :song, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          surname: { type: :string },
          age: { type: :integer },
          status: { type: :string },
          country: { type: :string },
          group_id: { type: :integer }
        },
        required: [ 'name', 'surname', 'age', 'status', 'country', 'group_id' ]
      }

      response '201', 'singer created' do
        let(:singer) { { name: 'Bob', surname: 'Brooks', age: 25, country: 'Germany', group_id: 1 } }
      end

      response '422', 'invalid request' do
        let(:singer) { { name: 'Bob' } }
        run_test!
      end
    end
  end

  path '/singers/{id}' do

    get 'Retrieves a singer' do
      tags 'Singers', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'singer found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            surname: { type: :string },
            age: { type: :integer },
            status: { type: :string },
            country: { type: :string },
            group_id: { type: :integer }
          },
          required: [ 'id', 'name', 'surname', 'age', 'status', 'country', 'group_id' ]

        let(:id) { Singer.create(name: 'Bob', surname: 'Brooks', age: 25, country: 'Germany', group_id: 1).id }
        run_test!
      end

      response '404', 'singer not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Bob' }
        run_test!
      end
    end
  end
end
