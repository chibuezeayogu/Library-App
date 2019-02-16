# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:params) do
    {
      email: 'test@mail.com',
      password: 'password'
    }
  end

  describe 'POST api/v1/signup' do
    context 'when params is empty' do
      before do
        post '/api/v1/users/signup', params: {}
      end

      it 'returns a validation error message' do
        expect(json['message'])
          .to match(['Email can\'t be blank', 'Password can\'t be blank'])
      end
    end

    context 'when an invalid email is supplied' do
      before do
        params[:email] = 'testmail.com'
        post '/api/v1/users/signup', params: params
      end

      it 'returns a validation error message' do
        expect(json['message']).to match(['Email is invalid'])
      end

      it 'should respone with status 400 bad request' do
        expect(response).to have_http_status(400)
      end
    end

    context 'when the request is valid ' do
      before { post '/api/v1/users/signup', params: params }

      it 'creates a new user' do
        expect(json['message']).to match('Account created successfully')
      end

      it 'should respone with status 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
