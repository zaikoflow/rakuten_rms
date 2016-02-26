require "spec_helper"

describe RakutenRms::Client::Item, :vcr do
  let(:configure) { RakutenRms::Configuration.new(service_secret: "service_secret", license_key: "license_key") }
  let(:client) { RakutenRms::Client::Item.new(configure) }

  describe "#item_get" do
    it "returns RakutenRms::Response instance" do
      response = client.item_get(itemUrl: "itemUrl")

      expect(response).to be_a RakutenRms::Response
    end
  end
end
