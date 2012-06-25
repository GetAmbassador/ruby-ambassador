module Mbsy
  class Ambassador < Base
    
    def self.find(params={})
      raise ArgumentError, "You must include :email" unless params[:email]
      call('get', params.reverse_merge(:auto_create => '0'))
    end
    
    def self.find_or_create(params={})
      raise ArgumentError, "You must include :email" unless params[:email]
      call('get', params)
    end
    
    def self.search(params={})
      call('all', params)
    end
    
  end
end