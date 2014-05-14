require 'spec_helper'

describe Mbsy::Base do
  describe '.element_name' do
    it 'returns element names' do
      allow(Mbsy::Base).to receive(:name).and_return("Test::Namespace::ElementName")
      expect(Mbsy::Base.element_name).to eql('element_name')
    end
  end

  describe '.api_url' do
    it 'returns a fully formed api url' do
      allow(Mbsy::Base).to receive(:element_name).and_return('test_element')
      expect(Mbsy::Base.api_url('get')).to eq "https://getambassador.com/api/v2/testuser/testapikey/json/test_element/get"
    end
  end

  describe '.call' do
    context 'with a 200 response' do
      let(:response) do
        {
          response: {
            code: '200',
            message: 'OK',
            data: {
              test: {
                foo: :bar
              }
            }
          }
        }.to_json
      end

      it 'returns response data' do
        allow(Mbsy::Base).to receive(:element_name).and_return('test_element')
        stub_request(:get, Mbsy::Base.api_url('get')).
          with(query: {campaign_uid: 123, email: 'a@example.com', output: :json}).
          to_return(body: response)
        expect(Mbsy::Base.call('get', {campaign_uid: 123, email: 'a@example.com'})).
          to eq({'test' => {'foo' => 'bar'}})
      end
    end

    def error_response(code)
      message = case code
                when '400'
                  'BAD REQUEST'
                when '401'
                  'UNAUTHORIZED'
                when '404'
                  'NOT FOUND'
                when '500'
                  'SERVER ERROR'
                end

      {
        response: {
          code: code,
          message: message,
          errors: {
            error: [
              'boom.'
            ]
          }
        }
      }.to_json
    end

    context 'error responses' do
      before do
        stub_request(:get, Mbsy::Base.api_url('get')).
          with(query: {output: :json}).
          to_return(body: response)
      end

      context 'with a 400 response' do
        let(:response) { error_response('400') }

        it 'raises BadRequestError' do
          expect { Mbsy::Base.call('get') }.to raise_error(Mbsy::BadRequestError)
        end
      end

      context 'with a 401 response' do
        let(:response) { error_response('401') }

        it 'raises UnauthorizedError' do
          expect { Mbsy::Base.call('get') }.to raise_error(Mbsy::UnauthorizedError)
        end
      end

      context 'with a 404 response' do
        let(:response) { error_response('404') }

        it 'raises a RecordNotFound' do
          expect { Mbsy::Base.call('get') }.to raise_error(Mbsy::RecordNotFound)
        end
      end

      context 'with a 500 response' do
        let(:response) { error_response('500') }

        it 'raises ServerError' do
          expect { Mbsy::Base.call('get') }.to raise_error(Mbsy::ServerError)
        end
      end

      context 'with another response' do
        let(:response) { error_response('300') }

        it 'raises a BadResponse' do
          expect { Mbsy::Base.call('get') }.to raise_error(Mbsy::BadResponse)
        end
      end
    end
  end
end
