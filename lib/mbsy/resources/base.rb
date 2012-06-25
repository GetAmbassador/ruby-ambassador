module Mbsy
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

      if response["code"] != '200'
        raise "Error from Ambassador API: #{response["errors"]["error"]} (code #{response["code"]})"
      end

      response['data']
    end
  end
end