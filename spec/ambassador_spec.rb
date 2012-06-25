require 'spec_helper'
require 'ruby-debug'

describe Mbsy::Ambassador do
  
  let(:resource_prefix) { "#{fake_domain}/ambassadors" }
  let(:existing_ambassador) { Mbsy::Ambassador.find(email: 'ambassador@mbsy.co', first_name: 'sigma') }

  context 'find existing ambassador' do
    before do
      FakeWeb.register_uri(:get, "#{resource_prefix}/get/", :query => existing_ambassador.attributes)
    end
    
    it 'is an instance of Mbsy::Ambassador' do
      debugger
      ambassador = Mbsy::Ambassador.find(email: 'ambassador@mbsy.co')
      ambassador.should be_instance_of(Mbsy::Ambassador)
    end
  
    it 'finds the correct ambassdor by email' do
      ambassador = Mbsy::Ambassador.find(email: 'ambassador@mbsy.co')
      ambassador.email.should eq(existing_ambassador.email)
    end
  
    it 'creates the ambassador if you cannot find one' do
      ambassador = Mbsy::Ambassador.find(email: 'ambassador@mbsy.co', first_name: 'tester')
      ambassador.first_name.should eq('tester')
    end
  end
  
  it 'returns a list of all ambassadors' do
    FakeWeb.register_uri(:get, "#{resource_prefix}/all/", :query => existing_ambassador.attributes)
    ambassadors = Mbsy::Ambassador.all
    ambassadors.should include(existing_ambassador)
  end
  
  it 'returns a list of all ambassadors' do
    FakeWeb.register_uri(:get, "#{resource_prefix}/stats/", :query => existing_ambassador.attributes)
    ambassador = Mbsy::Ambassador.find(email: 'ambassador@mbsy.co')
    ambassador.email.should eq(existing_ambassador.email)
  end
   
end