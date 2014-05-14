module Mbsy
  class Group < Base
    def self.find(params={})
      raise ArgumentError, "You must include :group_id" unless params[:group_id]
      call('get', params)
    end

    def self.all(params={})
      call('all', params)
    end
  end
end
