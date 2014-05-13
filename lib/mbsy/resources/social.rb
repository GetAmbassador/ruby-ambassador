module Mbsy
  class Social < Base
    def self.find(params={})
      raise ArgumentError, "You must include :email" unless params[:email]
      call('addthis', params)
    end
  end
end
