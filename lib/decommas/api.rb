module Decommas
  class Api
    include ::HTTParty
    base_uri 'https://datalayer.decommas.net/datalayer/api/v1/'

    class << self
      PAGINATION_LIMIT = 100

      def coins(address:, options: {})
        wget("/coins/#{address}", query: options)
      end

      def tokens(address:, options: {})
        wget("/tokens/#{address}", query: options)
      end

      def nfts(address:, options: {})
        wget("/nfts/#{address}", query: options)
      end

      def transactions(address:, limit: nil, offset: nil)
        query_params = {
          "limit" => limit || PAGINATION_LIMIT,
          "offset" => (offset if offset)
        }.compact
        wget("/transactions/#{address}", query: query_params)
      end

      def transfers_erc20(address:, limit: nil, offset: nil)
        query_params = {
          "limit" => limit || PAGINATION_LIMIT,
          "offset" => (offset if offset)
        }.compact
        wget("/transfers_erc20/#{address}", query: query_params)
      end

      def transfers_nft(address:, options: {})
        wget("/transfers_nft/#{address}", query: options)
      end

      def protocols(address:, options: {})
        wget("/protocols/#{address}", query: options)
      end

      def transaction_erc20_transfers(chain_name:, tx:)
        wget("/transaction_erc20_transfers/#{chain_name}/#{tx}")
      end

      def all_tokens_metadata
        wget("/all_tokens_metadata")
      end

      def all_coins_metadata
        wget("/all_coins_metadata")
      end

      def token_metadata(chain_name:, contract_address:)
        wget("/token_metadata/#{chain_name}/#{contract_address}")
      end

      private

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
        raise Decommas::TokenNotProvidedError.new unless token

        if options[:query]
          options[:query].merge!("api-key" => token)
        else
          options[:query] = { "api-key" => token }
        end

        if safe_mode?
          with_retry do
            response = Response.new(get(url, **options))
            raise ThrottledResponseError.new(response) if response.throttled?
            response
          end
        else
          Response.new(get(url, **options))
        end
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

