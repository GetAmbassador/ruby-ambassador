require 'spec_helper'

describe Mbsy::Base do
  
  it 'parses element names' do
    Mbsy::Base.stub!(:name).and_return("Test::Namespace::ElementName")
    Mbsy::Base.element_name.should eql('element_name')
  end

end