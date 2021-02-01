# frozen_string_literal: true

module Eve
  class CharacterDecorator < ApplicationDecorator
    decorates_associations :alliance, :ancestry, :bloodline, :corporation,
      :faction, :race, :character_corporation_histories

    def birthday
      object.birthday&.iso8601
    end

    def description
      Rails::Html::FullSanitizer.new.sanitize(object.description)
    end

    def security_status
      object.security_status.round(1).to_s
    end
  end
end
