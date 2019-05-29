# frozen_string_literal: true

require 'rails_helper'

describe Eve::TypeDogmaEffect do
  it { should be_a(ApplicationRecord) }

  it { expect(described_class.table_name).to eq('eve_type_dogma_effects') }

  it { should belong_to(:type).with_primary_key(:type_id).with_foreign_key(:type_id) }
end
