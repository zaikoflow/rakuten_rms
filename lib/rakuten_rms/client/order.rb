module RakutenRms
  class Client
    class Order
      API_URL = "https://orderapi.rms.rakuten.co.jp/rms/mall/order/api/ws?WSDL"

      def initialize(configuration)
        @configuration = configuration
      end

      def get_order(options = {})
        response = client.call(:get_order, { message: { arg0: authentication_hash }.merge(options) })

        Response.new(response.http)
      end

      private

      def client
        @client ||= Savon.client(wsdl: API_URL)
      end

      def authentication_hash
        {
          authKey:  @configuration.auth_key,
          shopUrl:  @configuration.shop_url,
          userName: @configuration.user_name
        }
      end
    end
  end
end
