# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'connpass/version'

Gem::Specification.new do |spec|
  spec.name          = "connpass-api"
  spec.version       = Connpass::VERSION
  spec.authors       = ["Yoshiyuki Hirano"]
  spec.email         = ["yhirano@me.com"]

  spec.summary       = %q{api client for Connpass (unofficial)}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/yhirano55/connpass-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday_middleware", "~> 0.11.0"
  spec.add_dependency "hashie", "~> 3.5.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rubocop", "~> 0.48.0"
  spec.add_development_dependency "rspec",   "~> 3.0"
end
