# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hello_sign/version'

Gem::Specification.new do |spec|
  spec.name          = "hello_sign"
  spec.version       = HelloSign::VERSION
  spec.authors       = "Võ Anh Duy"
  spec.email         = "voanhduy1512@live.com"
  spec.summary       = "A Ruby SDK for the HelloSign API."
  spec.description   = ""
  spec.homepage      = "http://www.hellosign.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "multi_json"
end
