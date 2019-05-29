# frozen_string_literal: true

module Eve
  class TypeImporter
    attr_reader :type_id

    def initialize(type_id)
      @type_id = type_id
    end

    def import
      eve_type = Eve::Type.find_or_initialize_by(type_id: type_id)

      esi = EveOnline::ESI::UniverseType.new(id: type_id)

      etag = Etag.find_or_initialize_by(url: esi.url)

      esi.etag = etag.etag

      return if esi.not_modified?

      eve_type.update!(esi.as_json)

      eve_type.type_dogma_attributes.destroy_all

      eve_type.type_dogma_effects.destroy_all

      esi.dogma_attributes.each do |dogma_attribute|
        eve_type.type_dogma_attributes.create!(dogma_attribute.as_json)
      end

      esi.dogma_effects.each do |dogma_effect|
        eve_type.type_dogma_effects.create!(dogma_effect.as_json)
      end

      etag.update!(etag: esi.etag)
    rescue EveOnline::Exceptions::ResourceNotFound
      eve_type.destroy!
    end
  end
end
