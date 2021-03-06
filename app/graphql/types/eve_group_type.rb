# frozen_string_literal: true

module Types
  class EveGroupType < Types::BaseObject
    description "Eve Group object"

    field :id, ID, null: false
    field :name, GraphQL::Types::JSON, null: true
    field :published, Boolean, null: true
    field :category_id, Integer, null: true
    field :category, Types::EveCategoryType, null: true
    field :types, Types::EveTypeType.connection_type, null: true

    def id
      object.group_id
    end

    def name
      {
        en: object.name_en,
        de: object.name_de,
        fr: object.name_fr,
        ja: object.name_ja,
        ru: object.name_ru,
        ko: object.name_ko
      }
    end
  end
end
