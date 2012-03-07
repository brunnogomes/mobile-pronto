require_relative '../lib/mobile_pronto'
 
#dependencies
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'turn'
 
Turn.config do |c|
 c.format  = :outline
 c.trace   = true
 c.natural = true
end
 
VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/mobile_pronto_cassettes'
  c.stub_with :webmock
end