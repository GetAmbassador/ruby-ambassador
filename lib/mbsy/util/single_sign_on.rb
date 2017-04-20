module Mbsy
  module SingleSignOn

    # produce the <img> tag to embed in your page to implement Single-Sign-On
    # :email is required and should be the user's email
    def self.embed_html(o)
      options = {
        api_key: Mbsy.api_key,
        token:   Mbsy::Company.token['token'],
        method:  :login
      }.merge(o)
      raise ArgumentError, "key :email is required" if options[:email].blank?
      raise ArgumentError, ":method must be either :login or :logout" unless %w(login logout).include?( options[:method].to_s )
      signature = Digest::SHA1.hexdigest( options[:api_key] + options[:email] )
      domain = if options[:domain].blank? then "#{Mbsy.user_name}.getambassador.com" else options[:domain] end
      %Q|<img src="https://#{domain}/sso/#{options[:method]}/?token=#{options[:token]}&email=#{CGI::escape(options[:email])}&signature=#{signature}" style="border: none; visibility: hidden" alt="" />|
    end


  end
end
