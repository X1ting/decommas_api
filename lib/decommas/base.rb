module Decommas
  class Base
    include ::HTTParty

    class << self
      PAGINATION_LIMIT = 100

      protected

      def with_retry(max_retries: 5, base_delay: 0.7, &block)
        def attempt(retries_left, delay, &block)
          block.call
        rescue => e
          if retries_left > 0
            puts "#{e} has been raised, retries_left: #{retries_left}"

            sleep(delay)
            attempt(retries_left - 1, delay * 2, &block)
          else
            raise e
          end
        end

        attempt(max_retries, base_delay, &block)
      end

      def wget(url, options = {})
        options = authorize(options)

        if safe_mode?
          with_retry do
            response = response_class.new(get(url, **options))
            raise ThrottledResponseError.new(response) if response.throttled?
            response
          end
        else
          response_class.new(get(url, **options))
        end
      end

      def wpost(url, options = {})
        options = authorize(options)

        if options[:headers]
          options[:headers].merge!("Content-Type" => "application/json")
        else
          options[:headers] = { "Content-Type" => "application/json"}
        end

        if options[:body] && !options[:body].kind_of?(String)
          options[:body] = options[:body].to_json
        end

        if safe_mode?
          with_retry do
            response = response_class.new(post(url, **options))
            raise ThrottledResponseError.new(response) if response.throttled?
            response
          end
        else
          response_class.new(post(url, **options))
        end
      end


      def authorize(options)
        raise Decommas::TokenNotProvidedError.new unless token

        if options[:query]
          options[:query].merge!("api-key" => token)
        else
          options[:query] = { "api-key" => token }
        end

        options
      end

      def response_class
        raise NotImplementedError.new
      end

      def token
        @token ||= Decommas.configuration.token
      end

      def safe_mode?
        @safe_mode ||= Decommas.configuration.safe_mode
      end
    end
  end
end

