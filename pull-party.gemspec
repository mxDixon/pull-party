# coding: utf-8
require 'pull-party/version'

Gem::Specification.new do |spec|
  spec.name          = 'pull-party'
  spec.version       = PullParty::VERSION
  spec.authors       = ['Job Acquisition Hackers']
  spec.email         = ['jobacquisition@careerbuilder.com']

  spec.summary       = 'api that provides endpoints to acquisition event logger gem'
  spec.homepage      = 'cloudatlas.careerbuilder.com'

  spec.require_paths = ['app']

  spec.add_dependency 'sinatra', '~> 1.4.6'
  spec.add_dependency 'pg', '~> 0.18'
  spec.add_dependency 'sequel', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.9.6'
  spec.add_development_dependency 'rake', '~> 10.4.2'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'rspec-pride', '~> 3.1.0'
  spec.add_development_dependency 'rack-test', '~> 0.6.2'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
end
