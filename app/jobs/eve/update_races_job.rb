# frozen_string_literal: true

module Eve
  class UpdateRacesJob < ApplicationJob
    queue_as :default

    retry_on EveOnline::Exceptions::Timeout,
      EveOnline::Exceptions::ServiceUnavailable,
      EveOnline::Exceptions::BadGateway,
      EveOnline::Exceptions::InternalServerError,
      OpenSSL::SSL::SSLError,
      Faraday::TimeoutError,
      Faraday::ConnectionFailed

    def perform
      LanguageMapper::LANGUAGES.each_key do |locale|
        Eve::RacesImporter.new(locale).import
      end
    end
  end
end
