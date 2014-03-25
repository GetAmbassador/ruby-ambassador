module Mbsy
  class Commission < Base
    
    def self.update(params={})
      raise ArgumentError, "You must include either :commission_id or :transaction_uid" unless params[:commission_id] or params[:transaction_uid]
      call('update', params)
    end
    
  end
end