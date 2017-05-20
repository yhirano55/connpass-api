# frozen_string_literal: true

require 'connpass/client'
require 'connpass/version'

module Connpass
  module_function

  def client
    @_client ||= Connpass::Client.new
  end

  def method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.public_send(method, *args, &block)
  end

  def respond_to_missing?(method, include_private = false)
    client.respond_to?(method, include_private) || super
  end
end
