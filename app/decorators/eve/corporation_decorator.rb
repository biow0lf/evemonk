# frozen_string_literal: true

module Eve
  class CorporationDecorator < ApplicationDecorator
    def date_founded
      object.date_founded.iso8601 if object.date_founded
    end

    def description
      Rails::Html::FullSanitizer.new.sanitize(object.description)
    end

    def icon
      "https://imageserver.eveonline.com/Corporation/#{ corporation_id }_256.png"
    end
  end
end
