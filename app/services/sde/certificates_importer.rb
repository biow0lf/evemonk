# frozen_string_literal: true

module Sde
  class CertificatesImporter
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def import
      entries = YAML.safe_load(File.read(file))

      entries.each_pair do |key, hash|
        eve_certificate = Eve::Certificate.find_or_initialize_by(certificate_id: key)

        # TODO: add `recommendedFor` and `skillTypes`
        eve_certificate.assign_attributes(description: hash["description"],
                                          group_id: hash["groupID"],
                                          name: hash["name"])

        eve_certificate.save!
      end
    end
  end
end