# frozen_string_literal: true

require "rails_helper"

describe CharacterAttributes do
  let(:character) do
    build(:character,
      perception: 23,
      memory: 24,
      willpower: 23,
      intelligence: 24,
      charisma: 20)
  end

  subject { described_class.new(character) }

  describe "#initialize" do
    its(:character) { should eq(character) }
  end

  describe "#total_perception" do
    specify { expect(subject.total_perception).to eq(26) }
  end

  describe "#perception_bonus"

  describe "#total_memory" do
    specify { expect(subject.total_memory).to eq(27) }
  end

  describe "#memory_bonus"

  describe "#total_willpower" do
    specify { expect(subject.total_willpower).to eq(26) }
  end

  describe "#willpower_bonus"

  describe "#total_intelligence" do
    specify { expect(subject.total_intelligence).to eq(27) }
  end

  describe "#intelligence_bonus"

  describe "#total_charisma" do
    specify { expect(subject.total_charisma).to eq(23) }
  end

  describe "#charisma_bonus"
end
