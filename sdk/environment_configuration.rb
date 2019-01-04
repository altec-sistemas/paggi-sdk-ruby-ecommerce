require '../sdk/token_validation'
require 'jwt'
# static class for environment setting
class EnvironmentConfiguration
  @@environment = ''
  @@partner_id = nil
  @@token = nil

  def self.set_token(token)
    return false unless TokenValidation.valid_token?(token)

    @@token = token
    set_partner_id_by_token(token)
    true
  end

  def self.set_partner_id_by_token(token); end

  def self.set_partner_id_by_partner_id(p_id)
    return false if p_id.nil? || (p_id == '')

    @@partner_id = p_id
    true
  end

  def self.set_environment(env); end
end
