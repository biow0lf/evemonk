# frozen_string_literal: true

module Eve
  class LoyaltyStoreOfferRecord < ApplicationRecord
    # belongs_to :corporation,
    #   primary_key: "corporation_id",
    #   optional: true
    #
    # belongs_to :type,
    #   primary_key: "type_id",
    #   optional: true
    #
    # has_many :required_items,
    #   foreign_key: "eve_loyalty_store_offer_id",
    #   dependent: :destroy
  end
end