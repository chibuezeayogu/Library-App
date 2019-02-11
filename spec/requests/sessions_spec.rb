# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  let!(:user) { create(:user) }
  let(:unregistered_user) do
    {
      email: 'test4hotmail.com',
      password: '1234567'
    }
  end
  let(:registered_user) do
    {
      email: user.email,
      password: user.password
    }
  end

  describe 'GET /api/v1' do
    context 'when a user visits the base route' do
      before { get '/api/v1' }

      it 'render the home page' do
        expect(json['message']).to match('Welcome to my Library App')
      end
    end

    context 'when a registered user log\'s in' do
      before { post '/api/v1/users/login', params: registered_user }

      it 'returns a message and a token' do
        expect(json['data']).to include('message', 'token')
        expect(json['data']['message']).to eq('Logged in successfully')
      end
    end
  end

  describe 'POST /api/v1/user/login' do
    context 'when invalid credentials are supplied' do
      before { post '/api/v1/users/login', params: unregistered_user }

      it 'returns invalid credentials' do
        expect(json['error']).to match('invalid credentials')
      end
    end

    context 'when a registered user log\'s in' do
      before { post '/api/v1/users/login', params: registered_user }

      it 'returns a message and a token' do
        expect(json['data']).to include('message', 'token')
        expect(json['data']['message']).to eq('Logged in successfully')
      end
    end
  end
end
