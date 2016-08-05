require 'json'
require 'rack/request'

module Oneetyan
  class Provider
    def call(env)
      req = Rack::Request.new(env)
      case req.path
      when '/oneetyan'
        body = { oneetyan: ['cocoa'] }
        [
          200,
          {
            'content-type' => 'application/json',
          },
          [JSON.generate(body)]
        ]
      else
        [404, {}, ['not found']]
      end
    end
  end
end
