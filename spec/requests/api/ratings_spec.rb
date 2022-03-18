require 'swagger_helper'

RSpec.describe 'api/ratings', type: :request do

  path '/ratings' do

    post 'Create a rating' do
      tags 'Ratings'
      consumes 'application/json'
      parameter name: :rating, in: :body, schema: {
        type: :object,
        properties: {
          number: { type: :integer },
          song_id: { type: :integer }
        },
        required: [ 'number', 'song_id' ]
      }

      response '201', 'rating created' do
        let(:rating) { { number: 10, song_id: 1 } }
      end

      response '422', 'invalid request' do
        let(:rating) { { number: 10 } }
        run_test!
      end
    end
  end

  path '/ratings/{id}' do

    get 'Retrieves a rating' do
      tags 'Ratings', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'rating found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            number: { type: :integer },
            song_id: { type: :integer }
          },
          required: [ 'id', 'number', 'song_id' ]

        let(:id) { Rating.create(number: 10, song_id: 1).id }
        run_test!
      end

      response '404', 'rating not found' do
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
