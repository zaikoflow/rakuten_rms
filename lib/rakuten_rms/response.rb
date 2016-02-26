module RakutenRms
  class Response
    attr_reader :response, :status, :headers, :body

    def initialize(response)
      @response = response
      @status   = response.try(:status) || response.try(:code)
      @headers  = response.headers
      @body     = response.body
    end

    def success?
      !!(@status.to_s =~ /\A2[0-9]{2}\z/)
    end

    def to_h
      Hash.from_xml(body)
    end
  end
end
