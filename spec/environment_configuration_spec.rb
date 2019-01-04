require '../sdk/environment_configuration.rb'

RSpec.describe EnvironmentConfiguration do
  describe '#set_partner_id_by_token' do
    context 'when token is valid' do
      it 'should set partner_id on variable and return true' do
        # check this out later
      end
    end
    context 'when token is invalid' do
      it 'should return false' do
      end
    end
    context 'when token is valid , but has no partner id' do
      it 'should return false' do
      end
    end
  end
  describe '#set_partner_id_by_partner_id' do
    context 'when argument is not empty or nil' do
      it 'should set partner_id and return true' do
      end
    end
  end
  describe '#set_token' do
    context 'when there is a valid token' do
      it 'should set token and return true' do
        expect(EnvironmentConfiguration.set_token('')).to eq true
      end
    end
    context 'when there is no valid token' do
      it 'should return false, as token was not valid to be set' do
        expect(EnvironmentConfiguration.set_token('')).to eq false
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
      end
    end
  end
end
