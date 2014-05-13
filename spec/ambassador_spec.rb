require 'spec_helper'

describe Mbsy::Ambassador do
  
  let(:resource_prefix) { "#{fake_domain}/ambassadors" }
  before do
    @existing_ambassador_response =  Mbsy::Ambassador.find(email: 'ambassador@mbsy.co', first_name: 'sigma')
  end

  context 'find existing ambassador' do
    subject { Mbsy::Ambassador.find(email: 'ambassador@mbsy.co') }
    pending 'is an instance of Mbsy::Ambassador' do
      expect(ambassador).to be_instance_of(Mbsy::Ambassador)
    end
    it { should be_instance_of(Hash) }
    it { should have_key('ambassador') }
    it { should == @existing_ambassador_response }

    it 'should return an ambassador with the same email' do
      expect(subject['ambassador']['email']).to eq(@existing_ambassador_response['ambassador']['email'])
    end
  end
  context 'existing ambassador not found' do
    before do
      # Stub out creation call since this is hitting a live service
      FakeWeb.register_uri(:get, "#{resource_prefix}/get/", query: {email: 'new_ambassador@mbsy.co', first_name: 'tester'}, response: File.expand_path('spec/fixtures/ambassador_response_v2.json') )
    end
    pending 'creates the ambassador if you cannot find one' do
      # Need a proper stubbed response before this can work
      ambassador = Mbsy::Ambassador.find(email: 'new_ambassador@mbsy.co', first_name: 'tester')
      expect(ambassador['ambassador']['first_name']).to eq('tester')
    end
    context 'failed lookup without auto-create' do
      it "should raise a RecordNotFound error " do
        expect{
          Mbsy::Ambassador.find(email: 'not_found@mbsy.co', auto_create: 0)
        }.to raise_error(Mbsy::RecordNotFound)
      end
    end
  end
  
  it 'returns a list of all ambassadors' do
    all_response = Mbsy::Ambassador.all
    ambassadors = all_response['ambassadors']
    expect(ambassadors.length).to be > 0
    existing_ambassador_in_response = ambassadors.detect{|a| a['email'] == @existing_ambassador_response['ambassador']['email'] }
    expect(existing_ambassador_in_response).not_to be_nil
    expect(existing_ambassador_in_response['first_name']).to eq('sigma')
  end
  
  it 'returns stats on an existing ambassador' do
    ambassador = Mbsy::Ambassador.stats(email: 'ambassador@mbsy.co')
    expect(ambassador['ambassador']['email']).to eq(@existing_ambassador_response['ambassador']['email'])
  end
   
end
