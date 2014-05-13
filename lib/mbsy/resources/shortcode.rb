module Mbsy
  class Shortcode < Base
    def self.find(params={})
      raise ArgumentError, "You must include :short_code" unless params[:short_code]
      call('get', params)
    end
  end
end
