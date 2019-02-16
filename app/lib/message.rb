# frozen_string_literal: true

class Message
  class << self
    def not_found(record = 'record')
      "Sorry, #{record} not found."
    end

    def invalid_credentials
      'Invalid credentials'
    end

    def invalid_token
      'Invalid token'
    end

    def missing_token
      'Missing token'
    end

    def unauthorized
      'Unauthorized request'
    end

    def account_created
      'Account created successfully'
    end

    def account_login
      'Logged in successfully'
    end

    def record_updated
      'Successfully Updated'
    end

    def record_deleted
      'Successfully deleted'
    end

    def record_created
      'Record successfully created'
    end

    def expired_token
      'Sorry, your token has expired. Please login to continue.'
    end
  end
end
