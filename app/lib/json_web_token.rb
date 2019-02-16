# frozen_string_literal: true

class JsonWebToken
  class << self
    HMAC_SECRET = Rails.application.credentials.secret_key_base

    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, HMAC_SECRET)
    end

    # Decodes the JWT with the signed secret
    def decode(token)
      JWT.decode(token, HMAC_SECRET)
    rescue JWT::DecodeError => e
      # raise custom error to be handled by custom handler
      raise ExceptionHandler::InvalidToken, e.message
    end
  end
end
