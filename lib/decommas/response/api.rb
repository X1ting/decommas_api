module Decommas
  module Response
    class Api < Base
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
    end
  end
end
