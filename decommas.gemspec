Gem::Specification.new do |s|
  s.name          = "decommas"
  s.version       = "0.0.2"
  s.summary       = "Ruby SDK for Decommas API"
  s.description   = "Developer friendly API for Decommas API written on Ruby"
  s.authors       = ["Ivan Takarlikov"]
  s.email         = "vtakarlikov@gmail.com"
  s.files         = ["lib/decommas.rb", "lib/decommas/api.rb", "lib/decommas/configuration.rb", "lib/decommas/errors.rb", "lib/decommas/response.rb"]
  s.require_paths = ["lib"]
  s.homepage      = "https://rubygems.org/gems/decommas"
  s.license       = "MIT"

  s.add_runtime_dependency "httparty", "~> 0"
end
