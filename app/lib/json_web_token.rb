# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload)
      payload.reverse_merge!(meta)
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    # Decodes the JWT with the signed secret
    def decode(token)
      JWT.decode(token, Rails.application.credentials.secret_key_base)
    end

    # Validates the payload hash for expiration and meta claims
    def valid_payload(payload)
      if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != mata[:aud]
        false
      else
        true
      end
    end

    # Default options to be encoded in the token
    def meta
      {
        exp: 2.days.from_now.to_i,
        iss: 'issuser_name',
        aud: 'client'
      }
    end

    # Validates if the token is expired by exp parameter
    def expired(payload)
      Time.at(payload['exp']) < Time.now
    end
  end
end
