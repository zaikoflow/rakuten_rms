module RakutenRms
  class Client
    class Item
      def initialize(configuration)
        @configuration = configuration
      end

      def item_get(params = {})
        response = client.get "#{BASE_PATH}/item/get", params

        Response.new(response)
      end

      private

      def client
        Faraday.new(url: BASE_URL) do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.headers['Authorization'] = @configuration.authorization
        end
      end
    end
  end
end
