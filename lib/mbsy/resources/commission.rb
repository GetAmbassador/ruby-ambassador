module Mbsy
  class Commission < Base
    def self.update(params={})
      raise ArgumentError, "You must include either :commission_uid or :transaction_uid" unless params[:commission_uid] or params[:transaction_uid]
      call('update', params)
    end

    def self.add(params={})
      raise ArgumentError, "You must include either :email or :uid" unless params[:email] or params[:uid]
      raise ArgumentError, "You must include :campaign_uid" unless params[:campaign_uid]
      raise ArgumentError, "You must include :amount" unless params[:amount]
      call('add', params)
    end

    def self.all(params={})
      call('all', params)
    end
  end
end
