# frozen_string_literal: true

module Response
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
end
