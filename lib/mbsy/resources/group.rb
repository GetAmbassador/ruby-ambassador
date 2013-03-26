module Mbsy
  class Group < Base
    
    def self.find(params={})
      raise ArgumentError, "You must include :email" unless params[:email]
      call('get', params)
    end
    
    def self.all(params={})
      call('all', params)
    end
    
  end
end
