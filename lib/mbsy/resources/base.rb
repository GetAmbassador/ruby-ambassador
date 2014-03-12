module Mbsy
  class RecordNotFound < StandardError; end
  class BadResponse < StandardError; end
  class Base
    include HTTParty
    format :json
    default_timeout 30
    default_params :output => 'json'
    
    def self.element_name
      name.split(/::/).last.underscore
    end
 
    def self.call(method, params = {})
      api_url = Mbsy.site_uri + self.element_name + '/' + method
      
      response = JSON.parse(self.get(api_url, :query => params).body)['response']
      case response['code']
      when "200" # Nothing to do here...
      when "404"
        raise RecordNotFound.new(response["errors"]["error"])
      else
        raise BadResponse.new(response: response)
      end

      response['data']
    end
  end
end