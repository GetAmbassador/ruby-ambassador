# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mbsy/version'

Gem::Specification.new do |s|
  s.name    = 'mbsy'
  s.version = Mbsy::VERSION
  s.summary = 'A Ruby wrapper for the Ambassador API'
  s.description = ''
  s.author = 'Tom Mullen, Chase Lee'
  s.email = 'support@getambassador.com'
  s.homepage = 'http://github.com/GetAmbassador/mbsy'
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9.2"

  s.add_runtime_dependency('httparty', '>= 0.8.3')
  s.add_runtime_dependency('json', '>= 1.7.3')

  s.add_development_dependency('rake', '>= 0.9.2')
  s.add_development_dependency('rspec', '~> 2.14.1')
  s.add_development_dependency('webmock', '~> 1.17.4')
  s.add_development_dependency('faker', '~> 1.3.0')
  s.add_development_dependency('shoulda-matchers', '2.6.1')
  s.add_development_dependency('activesupport', '>= 3.2.18')
end
