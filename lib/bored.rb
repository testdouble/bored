require "net/http"
require "json"
require_relative "bored/version"
require_relative "bored/cli"

module Bored
  class Error < StandardError; end

  Activity = Struct.new(
    :id, :description, :type, :participants,
    :accessibility, :price, :link,
    keyword_init: true
  )

  class << self
    def now(params = {})
      json = JSON.parse(Net::HTTP.get(uri(params)))
      raise Error.new(json["error"]) if json["error"]

      Activity.new(
        id: json["key"].to_i,
        description: json["activity"],
        type: json["type"].to_sym,
        participants: json["participants"],
        accessibility: json["accessibility"],
        price: json["price"],
        link: json["link"].empty? ? nil : json["link"]
      )
    end

    private

    def uri(params)
      uri = URI("https://www.boredapi.com/api/activity")
      uri.query = URI.encode_www_form(params.compact)

      uri
    end
  end
end
