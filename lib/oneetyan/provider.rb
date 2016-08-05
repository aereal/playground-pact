require 'json'

module Oneetyan
  class Provider
    def call(env)
      body = { message: 'ok' }
      [
        200,
        {
          'content-type'           => 'application/json',
        },
        [JSON.generate(body)]
      ]
    end
  end
end
