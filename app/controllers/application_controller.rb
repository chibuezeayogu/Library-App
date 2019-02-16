# frozen_string_literal: true

class ApplicationController < ActionController::API
  require 'json_web_token'
  include Response
  include ExceptionHandler

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    http_token
    @current_user ||= User.find(decode_token[0]['id']) if decode_token
  rescue ActiveRecord::RecordNotFound => e
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{e.message}")
    )
  end

  def http_token
    return request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?

    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end

  def decode_token
    @decode_token ||= JsonWebToken.decode(http_token)
  end
end
