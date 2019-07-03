# frozen_string_literal: true

require 'rails_helper'

describe Eve::CorporationDecorator do
  subject { described_class.new(double) }

  it { should be_a(ApplicationDecorator) }

  describe '#date_founded' do
    context 'when date_founded is empty' do
      let(:eve_corporation) do
        build(:eve_corporation,
              date_founded: nil)
      end

      subject { eve_corporation.decorate }

      specify { expect(subject.date_founded).to eq(nil) }
    end

    context 'when date_founded is present' do
      let(:eve_corporation) do
        build(:eve_corporation,
              date_founded: 'Sun, 03 May 2015 19:45:17 UTC +00:00')
      end

      subject { eve_corporation.decorate }

      specify { expect(subject.date_founded).to eq('2015-05-03T19:45:17Z') }
    end
  end

  describe '#description' do
    let(:eve_corporation) do
      build(:eve_corporation,
            description: '<b>Test</b>')
    end

    subject { eve_corporation.decorate }

    specify { expect(subject.description).to eq('Test') }
  end

  describe '#icon' do
    let(:eve_corporation) do
      build(:eve_corporation,
            corporation_id: 123)
    end

    subject { eve_corporation.decorate }

    specify { expect(subject.icon).to eq('https://imageserver.eveonline.com/Corporation/123_256.png') }
  end
end
