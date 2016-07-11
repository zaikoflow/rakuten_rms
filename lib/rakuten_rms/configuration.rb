module RakutenRms
  class Configuration
    attr_reader :service_secret, :license_key, :user_name, :shop_url, :auth_key

    def initialize(options = {})
      @service_secret = options[:service_secret]
      @license_key    = options[:license_key]

      # Old style authentication
      @user_name = options[:user_name]
      @shop_url  = options[:shop_url]
      @auth_key  = options[:auth_key] || authorization()
    end

    def authorization
      "ESA " + Base64.strict_encode64(@service_secret + ":" + @license_key) if @service_secret and @license_key
    end
  end
end
