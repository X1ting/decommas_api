module Decommas
  class Configuration
    attr_accessor :token
    attr_accessor :safe_mode

    def initialize
      @safe_mode ||= false
    end
  end
end
