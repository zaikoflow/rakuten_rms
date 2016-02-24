module RakutenRms
  class Client
    class Order
      def initialize(configuration)
        @configuration = configuration
      end

      def get_order(options = {})
        response = client.call(:get_order, { message: { arg0: { authKey: @configuration.authorization, shopUrl: "?", userName: "?" } }.merge(options) })

        Response.new(response)
      end

      private

      def client
        @client ||= Savon.client(wsdl: "#{BASE_URL}#{BASE_PATH}/order/ws?WSDL")
      end
    end
  end
end
