module Decommas
  class PriceService < Base
    base_uri 'https://datalayer.decommas.net/priceservice/'

    class << self
      def dexes(chain:, options: {})
        wget("/dexes/#{chain}", query: options)
      end

      def get_price(chain:, dex:, tokens: [], options: {})
        body = options.merge(
          chain: chain,
          dex: dex,
          tokens: tokens
        )
        wpost("/get_price", body: body)
      end

      def response_class
        Decommas::Response::PriceService
      end
    end
  end
end

