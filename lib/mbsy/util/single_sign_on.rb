module Mbsy
  module SingleSignOn

    # produce the <img> tag to embed in your page to implement Single-Sign-On
    # :email is required and should be the user's email
    # if :token is not passed, it will be requested from the API inline
    # (if you call this from a view, rendering the view will wait on that HTTP
    # request for the token)
    def self.embed_html(o)
      options = {
        api_key: Mbsy.api_key,
        token:   ( Mbsy::Company.token['token'] rescue nil),
        method:  :login
      }.merge(o)
      raise ArgumentError, "key :email is required" if options[:email].blank?
      raise ArgumentError, "key :token is required" if options[:token].blank?
      raise ArgumentError, ":method must be either :login or :logout" unless %w(login logout).include?( options[:method].to_s )
      signature = Digest::SHA1.hexdigest( options[:api_key] + options[:email] )
      %Q|<img src="https://#{Mbsy.user_name}.getambassador.com/sso/#{options[:method]}/?token=#{options[:token]}&email=#{URI.escape(options[:email])}&signature=#{signature}" style="border: none; visibility: hidden" alt="" />|
    end


  end
end
