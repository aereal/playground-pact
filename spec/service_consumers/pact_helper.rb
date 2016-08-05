require 'pact/provider/rspec'

Pact.service_provider 'Oneetyan Service'do
  honours_pact_with 'Oneetyan Client' do
    pact_uri File.expand_path('../pacts/oneetyan_client-oneetyan_service.json', __dir__)
  end
end

Pact.provider_states_for 'Oneetyan Client' do
  provider_state 'some oneetyan exists' do
    no_op
  end
end
