require 'jwt'

# static class responsible for validating tokens
class TokenValidation
  def self.valid_token?(token)
    decoded_token = JWT.decode(token, nil, false)
    return false unless decoded_token[0].key?('permissions')

    partner_id = decoded_token[0]['permissions'][0]['partner_id']
    return false if partner_id.nil? || (partner_id == '')

    true
  end

  def self.expired_token?(token)
    decoded_token = JWT.decode(token, nil, false)
    expiration = decoded_token[0]['exp']
    now = Time.now.to_i
    return true if expiration - now <= 0

    false
  end

  def self.expiring_token?(token)
    decoded_token = JWT.decode(token, nil, false)
    expiration = decoded_token[0]['exp']
    now = Time.now.to_i
    return true if expiration - now <= 2_592_000

    false
  end
end
