require 'json'
require 'net/http'
require 'uri'

module Oneetyan
  class Consumer
    attr_accessor :api_base

    def initialize(api_base)
      @api_base = api_base
    end

    def get_oneetyan
      uri = URI(@api_base)
      uri.path = '/oneetyan'

      res_body = Net::HTTP.get(uri)
      JSON.parse(res_body)
    end
  end
end
