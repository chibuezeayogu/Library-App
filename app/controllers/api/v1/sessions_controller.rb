# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request

      def index
        render :index, status: :ok
      end

      def create
        @user = User.where(email: params[:email]).first

        if @user&.valid_password?(params[:password])
          token = JsonWebToken.encode(id: @user.id, email: @user.email)
          response = { message: Message.account_login, token: token }
          json_response(response, :ok)
        else
          json_response({ message: Message.invalid_credentials }, :unauthorized)
        end
      end
    end
  end
end
