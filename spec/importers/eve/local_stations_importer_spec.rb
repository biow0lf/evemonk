# frozen_string_literal: true

require "rails_helper"

describe Eve::LocalStationsImporter do
  describe "#import" do
    let(:station_id) { double }

    before do
      #
      # Eve::Station.pluck(:station_id) => [station_id]
      #
      expect(Eve::Station).to receive(:pluck).with(:star_id).and_return([station_id])
    end

    before { expect(Eve::UpdateStationJob).to receive(:perform_later).with(station_id) }

    specify { expect { subject.import }.not_to raise_error }
  end
end
