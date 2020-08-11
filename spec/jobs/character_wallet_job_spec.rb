# frozen_string_literal: true

require "rails_helper"

describe CharacterWalletJob do
  it { should be_an(ApplicationJob) }

  it { expect(described_class.queue_name).to eq("important") }

  describe "#perform" do
    let(:character_id) { double }

    before do
      #
      # CharacterWalletImporter.new(character_id).import
      #
      expect(CharacterWalletImporter).to receive(:new).with(character_id) do
        double.tap do |a|
          expect(a).to receive(:import)
        end
      end
    end

    specify { expect { subject.perform(character_id) }.not_to raise_error }
  end
end
