require 'httparty'
require 'json'
require 'mbsy/resources/base'
require 'mbsy/resources/ambassador'
require 'mbsy/resources/balance'
require 'mbsy/resources/company'
require 'mbsy/resources/event'
require 'mbsy/resources/shortcode'
require 'mbsy/resources/social'

module Mbsy
  class << self
    attr_accessor :api_key, :user_name
    def configure
      yield self
      def self.site_uri
        "https://getambassador.com/api/v2/#{user_name}/#{api_key}/json/"
      end
    end
  end
end