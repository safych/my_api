require 'swagger_helper'

RSpec.describe 'api/songs', type: :request do

  path '/songs' do
    post 'Create a song' do
      tags 'Songs'
      consumes 'application/json'
      parameter name: :song, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          text: { type: :string },
          group_id: { type: :integer },
          disk_id: { type: :integer }
        },
        required: [ 'name', 'text', 'group_id', 'disk_id' ]
      }

      response '201', 'song created' do
        let(:song) { { name: 'Bro', text: "Bla bla bla", group_id: 1, disk_id: 1 } }
      end

      response '422', 'invalid request' do
        let(:song) { { name: 'Bro' } }
        run_test!
      end
    end
  end

  path '/songs' do
    get 'Display all songs' do
      tags 'Songs'
      produces 'application/json', 'application/xml'

      response '200', 'song found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            text: { type: :string },
            group_id: { type: :integer },
            disk_id: { type: :integer }
          },
          required: [ 'id', 'name', 'text', 'group_id', 'disk_id' ]

        let(:disk_id) { Song.create(name: 'Bro', text: "Bla bla bla", group_id: 1, disk_id: 1).disk_id }
        run_test!
      end

      response '404', 'song not found' do
        let(:disk_id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end

  path '/songs/{id}' do
    get 'Display a song by id' do
      tags 'Songs'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'song found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            text: { type: :string },
            group_id: { type: :integer },
            disk_id: { type: :integer }
          },
          required: [ 'id', 'name', 'text', 'group_id', 'disk_id' ]

        let(:id) { Song.create(name: 'Bro', text: "Bla bla bla", group_id: 1, disk_id: 1).id }
        run_test!
      end

      response '404', 'song not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end

  path '/songs?disk_id={disk_id}' do
    get 'Display a song by disk id' do
      tags 'Songs'
      produces 'application/json', 'application/xml'
      parameter name: :disk_id, in: :path, type: :string

      response '200', 'song found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            text: { type: :string },
            group_id: { type: :integer },
            disk_id: { type: :integer }
          },
          required: [ 'id', 'name', 'text', 'group_id', 'disk_id' ]

        let(:disk_id) { Song.create(name: 'Bro', text: "Bla bla bla", group_id: 1).disk_id }
        run_test!
      end

      response '404', 'song not found' do
        let(:disk_id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end

  path '/songs/{id}' do
    put 'Renewal a song' do
      tags 'Songs'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'song found' do
        consumes 'application/json'
        parameter name: :song, in: :body, schema: {
          properties: {
            name: { type: :string },
            text: { type: :string },
            group_id: { type: :integer },
            disk_id: { type: :integer }
          },
          required: [ 'id', 'name', 'text', 'group_id', 'disk_id' ]
        }
      end

      response '404', 'song not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/Fire' }
        run_test!
      end
    end
  end

  path '/songs/{id}' do
    delete 'Remove a song' do
      tags 'Songs'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'song found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            text: { type: :string },
            group_id: { type: :integer },
            disk_id: { type: :integer }
          },
          required: [ 'id', 'name', 'text', 'group_id', 'disk_id' ]

        let(:id) { Song.create(name: 'Bro', text: "Bla bla bla", group_id: 1, disk_id: 1).id }
        run_test!
      end

      response '404', 'song not found' do
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
