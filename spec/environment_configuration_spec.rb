require_relative '../sdk/environment_configuration'

RSpec.describe EnvironmentConfiguration do

  describe '#set_partner_id_by_token' do
    context 'when token is valid' do
      it 'should set partner_id on variable and return true' do
        expect(EnvironmentConfiguration.set_partner_id_by_token(ENV['TOKEN'])).to eq true
      end
    end
    context 'when token is invalid' do
      it 'should return false' do
        expect(EnvironmentConfiguration.set_partner_id_by_token(ENV['INVALIDTOKEN'])).to eq false
      end
    end
  end

  describe '#set_partner_id_by_partner_id' do
    context 'when argument is not empty or nil' do
      it 'should set partner_id and return true' do
        expect(EnvironmentConfiguration.set_partner_id_by_partner_id(ENV['PARTNERID'])).to eq true
      end
    end
  end

  describe '#set_token' do
    context 'when there is a valid token' do
      it 'should set token and return true' do
        expect(EnvironmentConfiguration.set_token(ENV['TOKEN'])).to eq true
      end
    end
    context 'when there is no valid token' do
      it 'should return false, as token was not valid to be set' do
        expect(EnvironmentConfiguration.set_token(ENV['INVALIDTOKEN'])).to eq false
      end
    end
  end

  describe '#set_environment' do
    context 'when environment is staging or production' do
      it 'should return the environment the SDK is on' do
        expect(EnvironmentConfiguration.set_environment('Staging')).to eq('STAGING')
      end
    end
    context 'when environment is not staging or production' do
      it 'should return an error message warning about the environment' do
        expect(EnvironmentConfiguration.set_environment('Testes')).to eq('O ambiente pode ser apenas Staging ou Prod')
      end
    end
  end
end
