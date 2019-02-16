# frozen_string_literal: true

module ControllerHelper
  def token_generator(user)
    JsonWebToken.encode(id: user.id, email: user.email)
  end

  def expired_token_generator(user)
    JsonWebToken.encode({ id: user.id, email: user.email }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      'Authorization' => token_generator(user),
      'Content-Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      'Content-Type' => 'application/json'
    }
  end

  def headers_with_expired_token
    {
      'Authorization' => expired_token_generator(user),
      'Content-Type' => 'application/json'
    }
  end
end
