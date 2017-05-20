# frozen_string_literal: true

require 'faraday_middleware'
require 'hashie'
require 'json'
require 'uri'

require 'connpass/resource_based_methods'

module Connpass
  class Client
    DEFAULT_ACCEPT     = 'application/json'
    DEFAULT_URL        = 'https://connpass.com'
    DEFAULT_USER_AGENT = "connpass-api Ruby Gem #{Connpass::VERSION}"

    DEFAULT_HEADERS = {
      'Accept'     => DEFAULT_ACCEPT,
      'User-Agent' => DEFAULT_USER_AGENT
    }.freeze

    include ResourceBasedMethods

    def get(path, params = nil, headers = nil)
      process(__callee__, path, params, headers)
    end

    alias post   get
    alias patch  get
    alias put    get
    alias delete get

    def connection
      @connection ||= Faraday.new(faraday_client_options) do |conn|
        conn.request  :json
        conn.response :mashify
        conn.response :json, content_type: /\bjson$/
        conn.response :logger
        conn.adapter  :net_http
      end
    end

    private

    def process(request_method, path, params, headers)
      connection.send(request_method, URI.escape(path), params, headers)
    end

    def faraday_client_options
      {
        headers: DEFAULT_HEADERS,
        url: DEFAULT_URL
      }
    end
  end
end
