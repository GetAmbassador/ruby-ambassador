require 'httparty'
require 'json'
require 'mbsy/resources/base'
require 'mbsy/resources/ambassador'
require 'mbsy/resources/commission'
require 'mbsy/resources/balance'
require 'mbsy/resources/company'
require 'mbsy/resources/event'
require 'mbsy/resources/group'
require 'mbsy/resources/shortcode'
require 'mbsy/resources/social'

module Mbsy
  class << self
    BASE_URI = "https://getambassador.com/api/v2"

    attr_accessor :api_key, :user_name

    def site_uri
      raise 'Mbsy not configured!' if user_name.nil? || api_key.nil?

      "#{BASE_URI}/#{user_name}/#{api_key}/json/"
    end

    def configure
      yield self
    end
  end
end
