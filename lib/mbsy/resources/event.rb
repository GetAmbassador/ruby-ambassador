module Mbsy
  class Event < Base
    
    def self.create(params={})
      raise ArgumentError, "You must include :campaign_uid" unless params[:campaign_uid]
      raise ArgumentError, "You must include :email" unless params[:email]
      call('record', params)
    end
    
  end
end