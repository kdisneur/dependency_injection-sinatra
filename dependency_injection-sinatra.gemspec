$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'sinatra/dependency_injection/version'

Gem::Specification.new do |spec|
  spec.name          = 'dependency_injection-sinatra'
  spec.version       = Sinatra::DependencyInjection::VERSION
  spec.summary       = 'Dependency Injection system for Sinatra'
  spec.description   = 'A Sinatra wrapper for a fully customizable Dependency injection system'
  spec.homepage      = 'https://github.com/kdisneur/dependency_injection-sinatra'
  spec.license       = 'MIT'
  spec.authors       = ['Kevin Disneur']
  spec.email         = 'kevin@koboyz.org'
  spec.files         = `git ls-files`.split($/)
  spec.require_paths = %w(lib)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_dependency('sinatra')
  spec.add_dependency('dependency_injection', '~> 0.4.2')
end
