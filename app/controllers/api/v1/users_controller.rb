# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)

        if @user.save
          token = JsonWebToken.encode(id: @user.id, email: @user.email)
          render :create, locals: {
            token: token
          }, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :bad_request
        end
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
