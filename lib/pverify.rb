# order matters
require "pverify/authentication"
require "pverify/configuration"
require "pverify/request"
require "pverify/restful_resource"
require "pverify/response"
require "pverify/version"

resources_path = File.expand_path('pverify/resources/*.rb', File.dirname(__FILE__))
Dir[resources_path].each { |f| require f[/\/lib\/(.+)\.rb$/, 1] }

require 'active_support/core_ext/hash'

module Pverify
  # Your code goes here...
  class AuthError < StandardError; end
  class AccessTokenNotPresentError < StandardError; end
  class InvalidApiUrlError < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
