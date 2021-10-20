# frozen_string_literal: true

require "net/http"
require "json"
require_relative "bored/version"

module Bored
  class Error < StandardError; end

  Activity = Struct.new(
    :id, :description, :type, :participants,
    :accessibility, :price, :link,
    keyword_init: true
  )

  def self.now
    json = JSON.parse(Net::HTTP.get(
      "www.boredapi.com", "/api/activity"
    ))
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
end
