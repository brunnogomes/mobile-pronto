require "httparty"
require "cgi"
Dir[File.dirname(__FILE__) + '/mobile_pronto/*.rb'].each do |file|
  require file
end