module Mbsy
  class MbsyError < StandardError; end
  class BadRequestError < MbsyError; end
  class UnauthorizedError < MbsyError; end
  class RecordNotFound < MbsyError; end
  class ServerError < MbsyError; end
  class BadResponse < MbsyError; end

  class Base
    include HTTParty
    format :json
    default_timeout 30
    default_params :output => 'json'

    def self.element_name
      name.split(/::/).last.underscore
    end

    def self.api_url(method)
      Mbsy.site_uri + self.element_name + '/' + method
    end

    def self.call(method, params = {}, type = :get)
      raise MbsyError.new("Unsupported type") unless (type == :get || type == :post)

      response = JSON.parse(self.send(type, api_url(method), :query => params).body)['response']
      case response['code']
      when '200' # Nothing to do here...
      when '400'
        raise BadRequestError.new(response['errors']['error'])
      when '401'
        raise UnauthorizedError.new(response['errors']['error'])
      when '404'
        raise RecordNotFound.new(response['errors']['error'])
      when '500'
        raise ServerError.new(response['errors']['error'])
      else
        raise BadResponse.new(response: response)
      end

      response['data']
    end
  end
end
