module Decommas
  class Api < Base
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

      def response_class
        Decommas::Response::Api
      end
    end
  end
end

