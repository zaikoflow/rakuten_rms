require "spec_helper"

describe RakutenRms::Response do
  let(:raw_response) { double(Faraday::Response, status: 200, headers: ["header"], body: "<body>body</body>") }
  let(:response) { RakutenRms::Response.new(raw_response) }

  describe "#initialize" do
    it "returns RakutenRms::Configuration instance" do
      expect(response.response).to eq raw_response
      expect(response.status).to   eq 200
      expect(response.headers).to  eq ["header"]
      expect(response.body).to     eq "<body>body</body>"
    end
  end

  describe "#success?" do
    it "returns true when status is 200" do
      raw_response = double(Faraday::Response, status: 200, headers: ["header"], body: "<body>body</body>")
      response = RakutenRms::Response.new(raw_response)

      expect(response.success?).to eq true
    end

    it "returns false when status is not 200" do
      raw_response = double(Faraday::Response, status: 400, headers: ["header"], body: "<body>body</body>")
      response = RakutenRms::Response.new(raw_response)

      expect(response.success?).to eq false
    end
  end

  describe "#to_h" do
    it "returns Hash" do
      raw_response = double(Faraday::Response, status: 200, headers: ["header"], body: "<body>body</body>")
      response = RakutenRms::Response.new(raw_response)

      expect(response.to_h).to eq ({ "body" => "body" })
    end
  end
end
