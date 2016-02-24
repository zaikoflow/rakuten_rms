module RakutenRms
  class Client
    BASE_URL = "https://api.rms.rakuten.co.jp"
    BASE_PATH = "/es/1.0"

    def initialize(options)
      @configuration = Configuration.new(options)
    end

    def order
      Client::Order.new(@configuration)
    end

    def item
      Client::Item.new(@configuration)
    end
  end
end
