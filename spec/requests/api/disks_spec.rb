require 'swagger_helper'

RSpec.describe 'api/disks', type: :request do

  path '/disks' do

    post 'Create a disk' do
      tags 'Disks'
      consumes 'application/json'
      parameter name: :disk, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          number_of_songs: { type: :integer }
        },
        required: [ 'name', 'number_of_songs' ]
      }

      response '201', 'disk created' do
        let(:disk) { { name: 'Fire', number_of_songs: 10 } }
      end

      response '422', 'invalid request' do
        let(:disk) { { name: 'Fire' } }
        run_test!
      end
    end
  end

  path '/disks/{id}' do

    get 'Retrieves a disk' do
      tags 'Disks', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'disk found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            number_of_songs: { type: :integer }
          },
          required: [ 'id', 'name', 'number_of_songs' ]

        let(:id) { Disk.create(name: 'Fire', number_of_songs: 10).id }
        run_test!
      end

      response '404', 'disk not found' do
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
