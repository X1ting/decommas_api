module Decommas
  class Response
    VALID_RESPONSES = [200]
    THROTTLED_RESPONSES = [429]

    attr_reader :code
    attr_reader :data
    attr_reader :message

    def initialize(response)
      # Workaround for 429 response that returns text/html content-type for some reason
      response_data = if response.parsed_response.kind_of?(String)
        JSON.parse(response.parsed_response)
      else
        response.parsed_response
      end
      @code = response.code
      @data = response_data["result"]
      @message = response_data["message"]
    end

    def success?
      @code.in?(VALID_RESPONSES)
    end

    def throttled?
      @code.in?(THROTTLED_RESPONSES)
    end
  end
end
