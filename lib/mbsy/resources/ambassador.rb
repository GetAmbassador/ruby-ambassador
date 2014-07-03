module Mbsy
  class Ambassador < Base
    def self.find(params={})
      raise ArgumentError, "You must include :email" unless params[:email]
      call('get', params)
    end

    def self.all(params={})
      call('all', params)
    end

    def self.stats(params={})
      raise ArgumentError, "You must include :email" unless params[:email]
      call('stats', params)
    end

    def self.update(params={})
      raise ArgumentError, "You must include :email or :uid" unless params[:email] || params[:uid]
      call('update', params)
    end

    def self.create(params={})
      raise ArgumentError, "You must include :email" unless params[:email]
      call('get', params, :post)
    end
  end
end
