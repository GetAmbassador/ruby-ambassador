require 'spec_helper'

describe Mbsy::Base do
  
  it 'parses element names' do
    allow(Mbsy::Base).to receive(:name).and_return("Test::Namespace::ElementName")
    expect(Mbsy::Base.element_name).to eql('element_name')
  end

end