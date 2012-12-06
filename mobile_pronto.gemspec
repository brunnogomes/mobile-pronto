# encoding: UTF-8
# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "mobile_pronto/version"

Gem::Specification.new do |s|
  s.name          = "mobile_pronto"
  s.version       = MobilePronto::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Brunno Gomes", "Guilherme Carvalho"]
  s.email         = ["brunnolgp@gmail.com", "guilherme@guava.com.br"]
  s.homepage      = "http://github.com/brunnogomes/mobile-pronto"
  s.summary       = "MobilePronto API Wrapper"
  s.require_paths = ['lib']

  s.add_development_dependency "webmock"
  s.add_development_dependency "vcr"
  s.add_development_dependency "turn"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  
  s.add_dependency "httparty"
end
