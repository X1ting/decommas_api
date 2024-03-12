Gem::Specification.new do |s|
  s.name          = "decommas"
  s.version       = "0.2.0"
  s.summary       = "Ruby SDK for Decommas API"
  s.description   = "Developer friendly API for Decommas API written on Ruby"
  s.authors       = ["Ivan Takarlikov"]
  s.email         = "vtakarlikov@gmail.com"
  s.files         = [
    "lib/decommas.rb", "lib/decommas/configuration.rb", "lib/decommas/errors.rb",
    "lib/decommas/base.rb", "lib/decommas/api.rb", "lib/decommas/price_service.rb",
    "lib/decommas/response/base.rb", "lib/decommas/response/api.rb", "lib/decommas/response/price_service.rb"
  ]
  s.require_paths = ["lib"]
  s.homepage      = "https://rubygems.org/gems/decommas"
  s.license       = "MIT"

  s.add_runtime_dependency "httparty", "~> 0.21.0"
end
