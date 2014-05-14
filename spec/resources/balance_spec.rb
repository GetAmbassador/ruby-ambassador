require 'spec_helper'

describe Mbsy::Balance do
  let(:response) { double(:response) }

  describe '.add' do
    before { allow(Mbsy::Balance).to receive(:call).and_return(response) }

    it 'raises ArgumentError when missing email' do
      expect { Mbsy::Balance.add }.to raise_error(ArgumentError, 'You must include :email')
      expect(Mbsy::Balance).to_not have_received(:call)
    end

    it 'raises ArgumentError when missing amount' do
      expect { Mbsy::Balance.add(email: 'a@example.com') }.to raise_error(ArgumentError, 'You must include :amount')
      expect(Mbsy::Balance).to_not have_received(:call)
    end

    it 'calls #call' do
      expect(Mbsy::Balance.add(email: 'a@example.com', amount: 1)).to eq response
      expect(Mbsy::Balance).to have_received(:call).with('add', email: 'a@example.com', amount: 1)
    end
  end

  describe '.deduct' do
    before { allow(Mbsy::Balance).to receive(:call).and_return(response) }

    it 'raises ArgumentError when missing email' do
      expect { Mbsy::Balance.deduct }.to raise_error(ArgumentError, 'You must include :email')
      expect(Mbsy::Balance).to_not have_received(:call)
    end

    it 'raises ArgumentError when missing amount' do
      expect { Mbsy::Balance.deduct(email: 'a@example.com') }.to raise_error(ArgumentError, 'You must include :amount')
      expect(Mbsy::Balance).to_not have_received(:call)
    end

    it 'calls #call' do
      expect(Mbsy::Balance.deduct(email: 'a@example.com', amount: 1)).to eq response
      expect(Mbsy::Balance).to have_received(:call).with('deduct', email: 'a@example.com', amount: 1)
    end
  end

  describe '.update' do
    let(:params) { double(:params) }
    it 'calls .add' do
      expect(Mbsy::Balance).to receive(:add).with(params).and_return(response)
      expect(Mbsy::Balance.update(:add, params)).to eq response
    end

    it 'calls .deduct' do
      expect(Mbsy::Balance).to receive(:deduct).with(params).and_return(response)
      expect(Mbsy::Balance.update(:deduct, params)).to eq response
    end
  end
end
