require '../sdk/token_validation.rb'

RSpec.describe TokenValidation do
  describe '#is_valid_token' do
    context 'when token is valid' do
      it 'should return true' do
        expect(TokenValidation.valid_token?(ENV['TOKEN'])).to eq(true)
      end
    end
    context 'when there is not valid' do
      it 'should return false' do
        expect(TokenValidation.valid_token?(ENV['INVALIDTOKEN'])).to eq(false)
      end
    end
  end
  describe '#is_expired_token' do
    context 'when token is expired' do
      it 'should return an error message that the token expired ' do
        expect(TokenValidation.expired_token?(ENV['EXPIREDTOKEN'])).to eq(true)
      end
    end
  end
  describe '#is_expiring_token' do
    it 'should return a warning message that the token is 30d from expiring' do
      expect(TokenValidation.expiring_token?(ENV['EXPIRINGTOKEN'])).to eq(true)
    end
  end
end
