module RakutenRms
  class Configuration
    def initialize(options = {})
      @service_secret = options[:service_secret]
      @license_key    = options[:license_key]
    end

    def authorization
      "ESA " + Base64.strict_encode64(@service_secret + ":" + @license_key)
    end
  end
end
