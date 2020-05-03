# frozen_string_literal: true

require "rails_helper"

describe WalletTransaction do
  it { should be_a(ApplicationRecord) }

  it { should belong_to(:character) }

  it { should belong_to(:type).class_name("Eve::Type").with_primary_key("type_id").with_foreign_key("type_id").optional(true) }

  it { should belong_to(:wallet_journal).with_primary_key("wallet_journal_id").with_foreign_key("journal_ref_id").optional(true) }

  it { should belong_to(:client).class_name("Eve::Character").with_primary_key("character_id").with_foreign_key("client_id").optional(true) }
end
