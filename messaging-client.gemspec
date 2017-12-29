# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'messaging/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'messaging-client'
  spec.version       = Messaging::Client::VERSION
  spec.authors       = ['Dmitriy Bielorusov']
  spec.email         = ['d.belorusov@gmail.com']
  spec.summary       = %q{Wrapper for sending requests to messaging-api.}
  spec.description   = %q{Wrapper for sending requests to messaging-api.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'curb'
end
