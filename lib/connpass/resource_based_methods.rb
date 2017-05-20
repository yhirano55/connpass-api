# frozen_string_literal: true

module Connpass
  module ResourceBasedMethods
    def list_events(params = nil, headers = nil)
      get('/api/v1/event/', params, headers)
    end
  end
end
