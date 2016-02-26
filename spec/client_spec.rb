require "spec_helper"

describe RakutenRms::Client do
  it { expect(RakutenRms::Client::BASE_URL).to  eq "https://api.rms.rakuten.co.jp" }
  it { expect(RakutenRms::Client::BASE_PATH).to eq "/es/1.0" }

  describe "#initialize" do
    it "returns RakutenRms::Client instance" do
      options = {}
      client = RakutenRms::Client.new(options)

      expect(client).to be_a RakutenRms::Client
      expect(client.configuration).to be_a RakutenRms::Configuration
    end
  end

  describe "#order" do
    it "returns RakutenRms::Client::Order instance" do
      options = {}
      client = RakutenRms::Client.new(options)

      expect(client.order).to be_a RakutenRms::Client::Order
    end
  end

  describe "#item" do
    it "returns RakutenRms::Client::Item instance" do
      options = {}
      client = RakutenRms::Client.new(options)

      expect(client.item).to be_a RakutenRms::Client::Item
    end
  end
end
