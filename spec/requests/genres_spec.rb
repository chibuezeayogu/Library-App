# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genre Api', type: :request do
  let!(:user) { create(:user) }
  let!(:genre) { create(:genre, genre: 'Fiction') }
  let(:genre_id) { genre.id }
  let(:headers) { valid_headers }
  let(:headers_without_auth) { invalid_headers }
  let(:expired_token_header) { headers_with_expired_token }

  describe 'GET /api/v1/genres' do
    context 'without an authorization token in the header' do
      before { get '/api/v1/genres', headers: headers_without_auth }
      it 'returns token validation error' do
        expect(response).to have_http_status(422)
        expect(json['message']).to match('Missing token')
      end
    end

    context 'with expired token' do
      before { get '/api/v1/genres', headers: expired_token_header }

      it 'returns token validation error' do
        expect(json['message']).to eq 'Signature has expired'
      end
    end

    context 'with valid headers' do
      before { get '/api/v1/genres', headers: headers }

      it 'should return all genres' do
        expect(json['genres']).not_to be_empty
        expect(json['genres'].size).to eq 1
      end
    end
  end

  describe 'POST /api/v1/genre/add' do
    context 'with valid headers and empty params' do
      before do
        post '/api/v1/genres/add',
             params: {},
             headers: headers
      end

      it 'return validation error' do
        expect(json['message'])
          .to eq(['Genre can\'t be blank', 'Genre is too short (minimum is 3 characters)'])
      end
    end
  end

  describe 'POST /api/v1/genre/add' do
    context 'with valid headers and params' do
      before do
        post '/api/v1/genres/add',
             params: { genre: 'Novel' }.to_json,
             headers: headers
      end

      it 'creates a genre' do
        expect(json['message']).to match('Record successfully created')
      end
    end
  end

  describe 'POST /api/v1/genres/add' do
    context 'when an admin tried to create a genre already created' do
      before do
        post '/api/v1/genres/add',
             params: { genre: 'Fiction' }.to_json,
             headers: headers
      end

      it 'returns an validation message' do
        expect(json['message']).to match(['Genre has already been taken'])
      end
    end
  end

  describe 'GET /api/v1/genres/:id' do
    context 'with valid headers and invalid non existing record' do
      before do
        get '/api/v1/genres/5',
            params: {},
            headers: headers
      end

      it 'return record not found error' do
        expect(json['message']).to match('Couldn\'t find Genre with \'id\'=5')
      end
    end
  end

  describe 'GET /api/v1/genres/:id' do
    context 'with valid headers and params' do
      before do
        get "/api/v1/genres/#{genre_id}",
            params: {},
            headers: headers
      end

      it 'return a single genre' do
        expect(json['genre']).not_to be_empty
      end
    end
  end

  describe 'PUT /api/v1/genres/:id/edit' do
    context 'with valid headers and params' do
      before do
        put "/api/v1/genres/#{genre_id}/edit",
            params: { genre: 'Fantasy' }.to_json,
            headers: headers
      end

      it 'return a success mesage' do
        expect(json['message']).to match('Successfully Updated')
        expect(json['genre']['genre']).to eq 'Fantasy'
      end
    end
  end

  describe 'DELETE /api/v1/genres/:id' do
    context 'with valid headers and params' do
      before do
        delete "/api/v1/genres/#{genre_id}",
               params: {},
               headers: headers
      end

      it 'return a success message' do
        expect(json['message']).to match('Successfully deleted')
      end
    end
  end
end
