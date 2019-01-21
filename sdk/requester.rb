require 'httpi'

# this'll be responsible for making the generic request methods
# todo: create classes at runtime based on datasets, like JSON or hashes
# done that, i'll have to make sure those recieve the methods listed here
module Requester
  include HTTPI
  # HTTPI.request(method, url, header, body)
  # to build a request i'll need:
  # method
  # url (specified in RestClient)
  # a guideline for the url:
  # protocol://environment/v1/partner_id(from token)/endpoint(class.downcase!)
  # header: auth and content-type
  # body: the classes i'll generate at runtime
end
