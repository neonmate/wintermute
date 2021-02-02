shared_examples :an_archivable_record do

  describe '.active' do

    it 'returns all records that are not archived' do
      record = create(described_class.name.underscore.to_sym)
      create(described_class.name.underscore.to_sym, :archived)

      expect(described_class.active).to contain_exactly(record)
    end

  end

  describe '#archive' do
    subject { create(described_class.name.underscore.to_sym) }

    it 'sets the current timestamp for archived_at' do
      Timecop.freeze('2000-01-01 00:00 +0100') do
        expect(subject.archived_at).to eq(nil)

        subject.archive

        expect(subject.archived_at).to eq(Time.parse('2000-01-01 00:00 +0100'))
      end
    end

    it 'returns true if the record can be archived' do
      expect(subject.archive).to eq(true)
    end

    it 'returns false if the record can not be archived' do
      allow(subject).to receive(:valid?).and_return(false)

      expect(subject.archive).to eq(false)
    end
  end

  describe '#archive!' do
    subject { create(described_class.name.underscore.to_sym) }

    it 'sets the current timestamp for archived_at' do
      Timecop.freeze('2000-01-01 00:00 +0100') do
        expect(subject.archived_at).to eq(nil)

        subject.archive!

        expect(subject.archived_at).to eq(Time.parse('2000-01-01 00:00 +0100'))
      end
    end

    it 'raises an error if the record can not be archived' do
      allow(subject).to receive(:valid?).and_return(false)

      expect { subject.archive! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#restore' do
    subject { create(described_class.name.underscore.to_sym, :archived) }

    it 'sets the archived_at attribute to nil' do
      expect(subject.archived_at).to be_a(Time)

      subject.restore

      expect(subject.archived_at).to eq(nil)
    end

    it 'returns true if the record can be restored' do
      expect(subject.restore).to eq(true)
    end

    it 'returns false if the record can be restored' do
      allow(subject).to receive(:valid?).and_return(false)

      expect(subject.restore).to eq(false)
    end
  end

  describe '#restore!' do
    subject { create(described_class.name.underscore.to_sym, :archived) }

    it 'sets the archived_at attribute to nil' do
      expect(subject.archived_at).to be_a(Time)

      subject.restore!

      expect(subject.archived_at).to eq(nil)
    end

    it 'raises an error if the record can not be restored' do
      allow(subject).to receive(:valid?).and_return(false)

      expect { subject.restore! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
