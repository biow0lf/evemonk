# frozen_string_literal: true

require "rails_helper"

describe Types::EveConstellationType do
  describe "get constellations" do
    let!(:eve_region1) do
      create(:eve_region,
        region_id: 400)
    end

    let!(:eve_region2) do
      create(:eve_region,
        region_id: 500)
    end

    let!(:eve_system1) do
      create(:eve_system,
        system_id: 600,
        constellation: eve_constellation1)
    end

    let!(:eve_system2) do
      create(:eve_system,
        system_id: 700,
        constellation: eve_constellation2)
    end

    let!(:eve_constellation1) do
      create(:eve_constellation,
        constellation_id: 123,
        name_en: "EN: name 1",
        name_de: "DE: name 1",
        name_fr: "FR: name 1",
        name_ja: "JA: name 1",
        name_ru: "RU: name 1",
        name_ko: "KO: name 1",
        region: eve_region1)
    end

    let!(:eve_constellation2) do
      create(:eve_constellation,
        constellation_id: 321,
        name_en: "EN: name 2",
        name_de: "DE: name 2",
        name_fr: "FR: name 2",
        name_ja: "JA: name 2",
        name_ru: "RU: name 2",
        name_ko: "KO: name 2",
        region: eve_region2)
    end

    let(:query) do
      %(
        {
          constellations(first: 2) {
            edges {
              node {
                id
                name
                regionId
                region {
                  id
                }
                systems(first: 1) {
                  edges {
                    node {
                      id
                    }
                    cursor
                  }
                  pageInfo {
                    endCursor
                    hasNextPage
                    hasPreviousPage
                    startCursor
                  }
                }
              }
              cursor
            }
            pageInfo {
              endCursor
              hasNextPage
              hasPreviousPage
              startCursor
            }
          }
        }
      )
    end

    let(:result) { EvemonkSchema.execute(query).as_json }

    specify do
      expect(result).to eq("data" => {
        "constellations" => {
          "edges" => [
            {
              "node" => {
                "id" => "123",
                "name" => {
                  "en" => "EN: name 1",
                  "de" => "DE: name 1",
                  "fr" => "FR: name 1",
                  "ja" => "JA: name 1",
                  "ru" => "RU: name 1",
                  "ko" => "KO: name 1"
                },
                "regionId" => 400,
                "region" => {
                  "id" => "400"
                },
                "systems" => {
                  "edges" => [
                    {
                      "node" => {
                        "id" => "600"
                      },
                      "cursor" => "MQ"
                    }
                  ],
                  "pageInfo" => {
                    "endCursor" => "MQ",
                    "hasNextPage" => false,
                    "hasPreviousPage" => false,
                    "startCursor" => "MQ"
                  }
                }
              },
              "cursor" => "MQ"
            },
            {
              "node" => {
                "id" => "321",
                "name" => {
                  "en" => "EN: name 2",
                  "de" => "DE: name 2",
                  "fr" => "FR: name 2",
                  "ja" => "JA: name 2",
                  "ru" => "RU: name 2",
                  "ko" => "KO: name 2"
                },
                "regionId" => 500,
                "region" => {
                  "id" => "500"
                },
                "systems" => {
                  "edges" => [
                    {
                      "node" => {
                        "id" => "700"
                      },
                      "cursor" => "MQ"
                    }
                  ],
                  "pageInfo" => {
                    "endCursor" => "MQ",
                    "hasNextPage" => false,
                    "hasPreviousPage" => false,
                    "startCursor" => "MQ"
                  }
                }
              },
              "cursor" => "Mg"
            }
          ],
          "pageInfo" => {
            "endCursor" => "Mg",
            "hasNextPage" => false,
            "hasPreviousPage" => false,
            "startCursor" => "MQ"
          }
        }
      })
    end
  end

  describe "get constellation by id" do
    let!(:eve_region) do
      create(:eve_region,
        region_id: 400)
    end

    let!(:eve_system) do
      create(:eve_system,
        system_id: 600,
        constellation: eve_constellation)
    end

    let!(:eve_constellation) do
      create(:eve_constellation,
        constellation_id: 123,
        name_en: "EN: name 1",
        name_de: "DE: name 1",
        name_fr: "FR: name 1",
        name_ja: "JA: name 1",
        name_ru: "RU: name 1",
        name_ko: "KO: name 1",
        region: eve_region)
    end

    let(:query) do
      %(
        {
          constellation(id: 123) {
            id
            name
            regionId
            region {
              id
            }
            systems(first: 1) {
              edges {
                node {
                  id
                }
                cursor
              }
              pageInfo {
                endCursor
                hasNextPage
                hasPreviousPage
                startCursor
              }
            }
          }
        }
      )
    end

    let(:result) { EvemonkSchema.execute(query).as_json }

    specify do
      expect(result).to eq("data" => {
        "constellation" => {
          "id" => "123",
          "name" => {
            "en" => "EN: name 1",
            "de" => "DE: name 1",
            "fr" => "FR: name 1",
            "ja" => "JA: name 1",
            "ru" => "RU: name 1",
            "ko" => "KO: name 1"
          },
          "regionId" => 400,
          "region" => {
            "id" => "400"
          },
          "systems" => {
            "edges" => [
              {
                "node" => {
                  "id" => "600"
                },
                "cursor" => "MQ"
              }
            ],
            "pageInfo" => {
              "endCursor" => "MQ",
              "hasNextPage" => false,
              "hasPreviousPage" => false,
              "startCursor" => "MQ"
            }
          }
        }
      })
    end
  end
end
