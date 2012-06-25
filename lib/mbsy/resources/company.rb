module Mbsy
  class Company < Base
        
    def self.get_details
      call('get')
    end
    
    def self.stats
      call('stats')
    end
    
  end
end