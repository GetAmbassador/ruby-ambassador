require 'spec_helper'

describe Mbsy do
  context 'configuration setup' do
    after { configure_mbsy! }

    it 'builds the url correctly' do
      expect {
        Mbsy.configure do |c|
          c.api_key = "API-123"
          c.user_name = "tester"
        end
      }.to change { Mbsy.site_uri.to_s }.to('https://getambassador.com/api/v2/tester/API-123/json/')
    end
  end
end
