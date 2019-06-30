# frozen_string_literal: true

module Eve
  class CharacterCorporationHistoryImporter
    attr_reader :character_id

    def initialize(character_id)
      @character_id = character_id
    end

    def import
      eve_character = Eve::Character.find_by!(character_id: character_id)

      esi = EveOnline::ESI::CharacterCorporationHistory.new(character_id: character_id)

      etag = Etag.find_or_initialize_by(url: esi.url)

      esi.etag = etag.etag

      return if esi.not_modified?

      esi.entries.each do |entry|
        history = eve_character.character_corporation_histories
                               .find_or_initialize_by(corporation_id: entry.corporation_id)

        history.update!(entry.as_json)
      end

      etag.update!(etag: esi.etag)
    rescue EveOnline::Exceptions::ResourceNotFound
      eve_character.destroy!
    rescue ActiveRecord::RecordNotFound
      Rails.logger.info("Character with ID #{ character_id } not found")
    end
  end
end
