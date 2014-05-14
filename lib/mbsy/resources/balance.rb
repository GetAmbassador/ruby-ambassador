module Mbsy
  class Balance < Base
    def self.update(mode, params={})
      case mode
      when :add
        add(params)
      when :deduct
        deduct(params)
      end
    end

    def self.add(params = {})
      raise ArgumentError, "You must include :email" unless params[:email]
      raise ArgumentError, "You must include :amount" unless params[:amount]

      call('add', params)
    end

    def self.deduct(params = {})
      raise ArgumentError, "You must include :email" unless params[:email]
      raise ArgumentError, "You must include :amount" unless params[:amount]

      call('deduct', params)
    end
  end
end
