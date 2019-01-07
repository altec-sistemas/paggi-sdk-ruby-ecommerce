require_relative 'token_validation'
require 'jwt'
# static class for environment setting
class EnvironmentConfiguration
  @@environment = ''
  @@partner_id = nil
  @@token = nil

  # sets token as an environment variable
  def self.set_token(token)
    return false unless TokenValidation.valid_token?(token)

    @@token = token
    set_partner_id_by_token(token)
    true
  end

  # gets partnerid from token and sets partnerid
  def self.set_partner_id_by_token(token)
    return false unless TokenValidation.valid_token?(token)

    decoded_token = JWT.decode(token, nil, false)
    @@partner_id = decoded_token[0]['permissions'][0]['partner_id']
    true
  end

  # gets partnerid externally and sets it to @@partner_id
  def self.set_partner_id_by_partner_id(p_id)
    return false if p_id.nil? || (p_id == '')

    @@partner_id = p_id
    true
  end

  # validates and sets the environment
  def self.set_environment(env)
    env.upcase!
    if %w[STAGING PROD].include?(env)
      @@environment = env
      return env
    end
    'O ambiente pode ser apenas Staging ou Prod'
  end
end
