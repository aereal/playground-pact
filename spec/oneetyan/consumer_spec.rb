require 'oneetyan/consumer'

require 'pact/consumer/rspec'

Pact.service_consumer 'Oneetyan' do
  has_pact_with 'Oneetyan Service' do
    mock_service :oneetyan_service do
      port 8888
    end
  end
end

describe 'Oneetyan::Consumer', pact: true do
  let(:api_base) { "http://localhost:8888" }
  let(:oneetyan_consumer) { Oneetyan::Consumer.new(api_base) }

  describe '#get_oneetyan' do
    it "returns some oneetyan" do
      oneetyan_service.given('some oneetyan exists').
        upon_receiving('simple request').
        with(method: :get, path: '/oneetyan', query: '').
        will_respond_with(
          status: 200,
          headers: {
            'content-type' => 'application/json',
          },
          body: {
            oneetyan: ['cocoa'],
          },
        )

      expect(oneetyan_consumer.get_oneetyan).to eq({ 'oneetyan' => ['cocoa'] })
    end
  end
end
