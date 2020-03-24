# frozen_string_literal: true

class CharacterBlueprintsImporter < CharacterBaseImporter
  attr_reader :page

  def initialize(character_id, page = 1)
    super(character_id)

    @page = page
  end

  def update!
    refresh_character_access_token

    esi = EveOnline::ESI::CharacterBlueprints.new(character_id: character.character_id,
                                                  token: character.access_token,
                                                  page: page)

    return unless character_scope_present?(esi.scope)

    character.character_blueprints.destroy_all if page == 1

    esi.blueprints.each do |blueprint|
      character.character_blueprints.create!(blueprint.as_json)
    end

    import_other_pages(esi.total_pages)
  end

  def import_other_pages(total_pages)
    return if page != 1 || total_pages == 1

    (2..total_pages).each do |next_page|
      CharacterBlueprintsImporter.perform_later(character_id, next_page)
    end
  end
end