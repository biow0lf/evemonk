# frozen_string_literal: true

require "rails_helper"

describe Eve::CorporationDashboard do
  it { should be_an(Administrate::BaseDashboard) }

  describe "#display_resource" do
    let(:corporation) { build(:eve_corporation, name: "Freighting Solutions Inc.") }

    specify { expect(subject.display_resource(corporation)).to eq("Freighting Solutions Inc.") }
  end
end
