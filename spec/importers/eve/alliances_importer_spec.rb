# frozen_string_literal: true

require 'rails_helper'

describe Eve::AlliancesImporter do
  describe '#initialize' do
    let(:esi) { instance_double(EveOnline::ESI::Alliances) }

    before { expect(EveOnline::ESI::Alliances).to receive(:new).and_return(esi) }

    its(:esi) { should eq(esi) }
  end

  describe '#import' do
    context 'when fresh data available' do
      let(:etag) { instance_double(Etag, etag: '97f0c48679f2b200043cdbc3406291fc945bcd652ddc7fc11ccdc37a') }

      let(:new_etag) { double }

      let(:esi) do
        instance_double(EveOnline::ESI::Alliances,
                        not_modified?: false,
                        etag: new_etag)
      end

      before { expect(EveOnline::ESI::Alliances).to receive(:new).and_return(esi) }

      before { expect(subject).to receive(:etag).and_return(etag).twice }

      before { expect(esi).to receive(:etag=).with('97f0c48679f2b200043cdbc3406291fc945bcd652ddc7fc11ccdc37a') }

      before { expect(subject).to receive(:import_new_alliances) }

      before { expect(subject).to receive(:remove_old_alliances) }

      before { expect(etag).to receive(:update!).with(etag: new_etag) }

      specify { expect { subject.import }.not_to raise_error }
    end

    context 'when no fresh data available' do
      let(:etag) { instance_double(Etag, etag: '97f0c48679f2b200043cdbc3406291fc945bcd652ddc7fc11ccdc37a') }

      let(:esi) do
        instance_double(EveOnline::ESI::Alliances,
                        not_modified?: true)
      end

      before { expect(EveOnline::ESI::Alliances).to receive(:new).and_return(esi) }

      before { expect(subject).to receive(:etag).and_return(etag) }

      before { expect(esi).to receive(:etag=).with('97f0c48679f2b200043cdbc3406291fc945bcd652ddc7fc11ccdc37a') }

      before { expect(subject).not_to receive(:import_new_alliances) }

      before { expect(subject).not_to receive(:remove_old_alliances) }

      before { expect(etag).not_to receive(:update!) }

      specify { expect { subject.import }.not_to raise_error }
    end
  end

  # private methods

  describe '#etag' do
    context 'when @etag set' do
      let(:etag) { instance_double(Etag) }

      before { subject.instance_variable_set(:@etag, etag) }

      specify { expect(subject.send(:etag)).to eq(etag) }
    end

    context 'when @etag not set' do
      let(:url) { double }

      let(:esi) { instance_double(EveOnline::ESI::Alliances, url: url) }

      let(:etag) { instance_double(Etag) }

      before { expect(EveOnline::ESI::Alliances).to receive(:new).and_return(esi) }

      before { expect(Etag).to receive(:find_or_initialize_by).with(url: url).and_return(etag) }

      specify { expect { subject.send(:etag) }.not_to raise_error }

      specify { expect { subject.send(:etag) }.to change { subject.instance_variable_get(:@etag) }.from(nil).to(etag) }
    end
  end

  describe '#import_new_alliances' do
    let(:alliance_id) { double }

    let(:esi) do
      instance_double(EveOnline::ESI::Alliances,
                      alliance_ids: [alliance_id])
    end

    before { expect(EveOnline::ESI::Alliances).to receive(:new).and_return(esi) }

    context 'when alliance not imported' do
      before { expect(Eve::Alliance).to receive(:exists?).with(alliance_id: alliance_id).and_return(false) }

      before { expect(Eve::AllianceImporterWorker).to receive(:perform_async).with(alliance_id) }

      specify { expect { subject.send(:import_new_alliances) }.not_to raise_error }
    end

    context 'when alliance already imported' do
      before { expect(Eve::Alliance).to receive(:exists?).with(alliance_id: alliance_id).and_return(true) }

      before { expect(Eve::AllianceImporterWorker).not_to receive(:perform_async) }

      specify { expect { subject.send(:import_new_alliances) }.not_to raise_error }
    end
  end

  describe '#remove_old_alliances' do
    let(:alliance_id) { double }

    let(:alliance_ids) { [alliance_id] }

    let(:esi) do
      instance_double(EveOnline::ESI::Alliances,
                      alliance_ids: alliance_ids)
    end

    before { expect(EveOnline::ESI::Alliances).to receive(:new).and_return(esi) }

    let(:eve_alliance_ids) { double }

    before { expect(Eve::Alliance).to receive(:pluck).with(:alliance_id).and_return(eve_alliance_ids) }

    let(:alliance_id_to_remove) { double }

    let(:alliance_ids_to_remove) { [alliance_id_to_remove] }

    before { expect(eve_alliance_ids).to receive(:-).with(alliance_ids).and_return(alliance_ids_to_remove) }

    let(:corporation_id) { double }

    let(:corporation) { instance_double(Eve::Corporation, corporation_id: corporation_id) }

    let(:corporations) { [corporation] }

    let(:eve_alliance) { instance_double(Eve::Alliance, corporations: corporations) }

    before { expect(Eve::Alliance).to receive(:find_or_initialize_by).with(alliance_id: alliance_id_to_remove).and_return(eve_alliance) }

    before { expect(Eve::CorporationImporterWorker).to receive(:perform_async).with(corporation_id) }

    before { expect(eve_alliance).to receive(:destroy!) }

    specify { expect { subject.send(:remove_old_alliances) }.not_to raise_error }
  end
end
