# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def index
        render :index, status: :ok
      end

      def create
        @user = User.where(email: params[:email]).first

        if @user&.valid_password?(params[:password])
          token = JsonWebToken.encode(id: @user.id, email: @user.email)
          render :create, locals: {
            message: 'Logged in successfully',
            token: token
          }, status: :ok
        else
          render json: { error: 'invalid credentials' }, status: :unauthorized
        end
      end
    end
  end
end
