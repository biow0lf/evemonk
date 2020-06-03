# frozen_string_literal: true

require "administrate/base_dashboard"

module Eve
  class AllianceDashboard < Administrate::BaseDashboard
    ATTRIBUTE_TYPES = {
      id: Field::Number,
      alliance_id: Field::Number,
      creator_corporation: Field::BelongsTo.with_options(class_name: "Eve::Corporation"),
      creator: Field::BelongsTo.with_options(class_name: "Eve::Character"),
      date_founded: Field::DateTime,
      executor_corporation: Field::BelongsTo.with_options(class_name: "Eve::Corporation"),
      faction: Field::BelongsTo.with_options(class_name: "Eve::Faction"),
      name: Field::String,
      ticker: Field::String,
      corporations_count: Field::Number,
      characters_count: Field::Number,
      created_at: Field::DateTime,
      updated_at: Field::DateTime
    }.freeze

    COLLECTION_ATTRIBUTES = [:alliance_id, :name].freeze

    SHOW_PAGE_ATTRIBUTES = [
      :id,
      :alliance_id,
      :creator_corporation,
      :creator,
      :date_founded,
      :executor_corporation,
      :faction,
      :name,
      :ticker,
      :corporations_count,
      :characters_count,
      :created_at,
      :updated_at
    ].freeze

    FORM_ATTRIBUTES = [
      :alliance_id,
      :creator_corporation,
      :creator,
      :date_founded,
      :executor_corporation,
      :faction,
      :name,
      :ticker
    ].freeze

    COLLECTION_FILTERS = {}.freeze

    def display_resource(alliance)
      alliance.name
    end
  end
end
