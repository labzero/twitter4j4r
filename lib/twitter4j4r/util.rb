require 'jar/twitter4j-core-3.0.3.jar'
require 'json'

module Twitter4j4r
  class Util

    # convert status to hash
    def self.status_to_hash(status)
      json = status_to_raw_json(status)
      if json
        JSON.parse(json)
      end
    end

    # convert status to raw json
    def self.status_to_raw_json(status)
      Java::Twitter4jJson::DataObjectFactory.getRawJSON(status)
    end

  end
end
