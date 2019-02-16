# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request

      def create
        user = User.new(user_params)

        if user.save
          token = JsonWebToken.encode(id: user.id, email: user.email)
          response = { message: Message.account_created, token: token }
          json_response(response, :created)
        else

          json_response({ message: user.errors.full_messages }, :bad_request)
        end
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
