module Decommas
  class TokenNotProvidedError < StandardError
    def initialize
      super("Please provide token in configuration!")
    end
  end

  class ResponseError < StandardError
    def initialize(response)
      super("DecommasApi returned: #{response.code} #{response.message}")
    end
  end

  class ThrottledResponseError < StandardError
    def initialize(response)
      super("DecommasApi throttled you with: #{response.code} #{response.message}")
    end
  end
end
