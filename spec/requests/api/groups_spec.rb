require 'swagger_helper'

RSpec.describe 'api/groups', type: :request do

  path '/groups' do
    post 'Create a group' do
      tags 'Groups'
      consumes 'application/json'
      parameter name: :group, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          country: { type: :string }
        },
        required: [ 'name', 'country' ]
      }

      response '201', 'group created' do
        let(:group) { { name: 'Fire', country: 'UK' } }
      end

      response '422', 'invalid request' do
        let(:group) { { name: 'Fire' } }
        run_test!
      end
    end
  end

  path '/groups' do
    get 'Display all groups' do
      tags 'Groups'
      produces 'application/json', 'application/xml'

      response '200', 'group found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            country: { type: :string }
          },
          required: [ 'id', 'name', 'country' ]

          let(:id) { Group.create(name: 'Fire', country: 'UK').id }
          run_test!
      end

      response '404', 'group not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end

  path '/groups/{id}' do
    get 'Display a group by id' do
      tags 'Groups'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'group found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            country: { type: :string }
          },
          required: [ 'id', 'name', 'country' ]

        let(:id) { Group.create(name: 'Fire', country: 'UK').id }
        run_test!
      end

      response '404', 'group not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end

  path '/groups/{id}' do
    put 'Renewal a group' do
      tags 'Groups'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'group found' do
        consumes 'application/json'
        parameter name: :group, in: :body, schema: {
          properties: {
            name: { type: :string },
            country: { type: :string }
          },
          required: [ 'id', 'name', 'country' ]
        }
      end

      response '404', 'group not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end

  path '/groups/{id}' do
    delete 'Remove a group' do
      tags 'Groups'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'group found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            country: { type: :string }
          },
          required: [ 'id', 'name', 'country' ]

        let(:id) { Group.create(name: 'Fire', country: 'UK').id }
        run_test!
      end

      response '404', 'group not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end
end
