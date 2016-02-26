require "spec_helper"

describe RakutenRms::Configuration do
  let(:configuration) do
    options = {
      auth_key:       "auth_key",
      license_key:    "license_key",
      service_secret: "service_secret",
      shop_url:       "shop_url",
      user_name:      "user_name"
    }

    RakutenRms::Configuration.new(options)
  end

  describe "#initialize" do
    it "returns RakutenRms::Configuration instance" do
      expect(configuration.auth_key).to       eq "auth_key"
      expect(configuration.license_key).to    eq "license_key"
      expect(configuration.service_secret).to eq "service_secret"
      expect(configuration.shop_url).to       eq "shop_url"
      expect(configuration.user_name).to      eq "user_name"
    end
  end

  describe "#authorization" do
    it "returns authoration string" do
      expect(configuration.authorization).to eq "ESA c2VydmljZV9zZWNyZXQ6bGljZW5zZV9rZXk="
    end
  end
end
