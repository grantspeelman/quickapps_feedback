# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quickapps_feedback/version'

Gem::Specification.new do |spec|
  spec.name          = 'quickapps_feedback'
  spec.version       = QuickappsFeedback::VERSION
  spec.authors       = ['Grant Speelman']
  spec.email         = ['grant.speelman@ubxd.com']
  spec.summary       = %q(Simple sinatra rack middleware for quickapps feedback)
  spec.description   = %q(Simple sinatra rack middleware for quickapps feedback)
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sinatra', '~> 1.4'
  spec.add_dependency 'uservoice-ruby', '~> 0.0.11'
  spec.add_dependency 'excon', '>= 0.39.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'capybara'
end
