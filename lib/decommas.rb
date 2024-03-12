require 'httparty'

require 'decommas/base'
require 'decommas/api'
require 'decommas/price_service'
require 'decommas/configuration'
require 'decommas/errors'
require 'decommas/response/base'
require 'decommas/response/api'
require 'decommas/response/price_service'

module Decommas
  class << self
    # Instantiate the Configuration singleton
    # or return it. Remember that the instance
    # has attribute readers so that we can access
    # the configured values
    def configuration
      @configuration ||= Configuration.new
    end

    # This is the configure block definition.
    # The configuration method will return the
    # Configuration singleton, which is then yielded
    # to the configure block. Then it's just a matter
    # of using the attribute accessors we previously defined
    def configure
      yield(configuration)
    end
  end
end
