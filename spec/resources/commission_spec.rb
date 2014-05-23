require 'spec_helper'

describe Mbsy::Commission do
  let(:response) { double(:response) }
  before { allow(Mbsy::Commission).to receive(:call).and_return(response) }

  describe '.update' do
    it 'raises ArgumentError when missing commission_uid or transaction_uid param' do
      expect { Mbsy::Commission.update }.to raise_error(ArgumentError, 'You must include either :commission_uid or :transaction_uid')
      expect(Mbsy::Commission).to_not have_received(:call)
    end

    it 'calls #call when passed :commission_uid' do
      expect(Mbsy::Commission.update(commission_uid: 999)).to eq response
      expect(Mbsy::Commission).to have_received(:call).with('update', commission_uid: 999)
    end

    it 'calls #call when passed :transaction_uid' do
      expect(Mbsy::Commission.update(transaction_uid: 999)).to eq response
      expect(Mbsy::Commission).to have_received(:call).with('update', transaction_uid: 999)
    end
  end

  describe '.all' do
    it 'calls #call' do
      expect(Mbsy::Commission.all).to eq response
      expect(Mbsy::Commission).to have_received(:call).with('all', {})
    end
  end

  describe '.add' do
    it 'raises ArgumentError when missing email or uid param' do
      expect { Mbsy::Commission.add }.to raise_error(ArgumentError, 'You must include either :email or :uid')
      expect(Mbsy::Commission).to_not have_received(:call)
    end

    it 'raises ArgumentError when missing campaign_uid param' do
      expect { Mbsy::Commission.add(email: 'a@example.com') }.to raise_error(ArgumentError, 'You must include :campaign_uid')
      expect(Mbsy::Commission).to_not have_received(:call)
    end

    it 'raises ArgumentError when missing amount param' do
      expect { Mbsy::Commission.add(email: 'a@example.com', campaign_uid: 999) }.to raise_error(ArgumentError, 'You must include :amount')
      expect(Mbsy::Commission).to_not have_received(:call)
    end

    it 'calls #call' do
      expect(Mbsy::Commission.add(email: 'a@example.com', campaign_uid: 999, amount: 50)).to eq response
      expect(Mbsy::Commission).to have_received(:call).with('add', email: 'a@example.com', campaign_uid: 999, amount: 50)
    end
  end
end

