require 'pact/provider/rspec'

Pact.service_provider 'Oneetyan Service'do
  honours_pact_with 'Oneetyan' do
    pact_uri File.expand_path('../pacts/oneetyan-oneetyan_service.json', __dir__)
  end
end
