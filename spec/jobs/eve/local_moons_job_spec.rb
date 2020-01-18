# frozen_string_literal: true

require "rails_helper"

describe Eve::LocalMoonsJob do
  it { expect(described_class.queue_name).to eq("default") }

  describe "#perform" do
    before do
      #
      # Eve::LocalMoonsImporter.new.import
      #
      expect(Eve::LocalMoonsImporter).to receive(:new) do
        double.tap do |a|
          expect(a).to receive(:import)
        end
      end
    end

    specify { expect { subject.perform }.not_to raise_error }
  end
end
