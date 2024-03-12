module Decommas
  module Response
    class Base
      VALID_RESPONSES = [200]
      THROTTLED_RESPONSES = [429]

      attr_reader :code
      attr_reader :data
      attr_reader :message

      def success?
        VALID_RESPONSES.include?(@code)
      end

      def throttled?
        THROTTLED_RESPONSES.include?(@code)
      end
    end
  end
end
