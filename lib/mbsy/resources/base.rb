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

    class << self
      def element_name
        name.split(/::/).last.underscore
      end

      def api_url(method)
        Mbsy.site_uri + element_name + '/' + method
      end

      def call(method, params = {})
        response = JSON.parse(self.get(api_url(method), :query => params).body)['response']
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
end
