describe HackerNewsItem do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to allow_values('job', 'story', 'comment', 'poll', 'pollopt').for(:type) }
    it { is_expected.not_to allow_values(nil, '', 'other').for(:type) }

    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_numericality_of(:score).only_integer }

    it { is_expected.to validate_presence_of(:descendants) }
    it { is_expected.to validate_numericality_of(:descendants).only_integer }

    it { is_expected.to allow_values(true, false).for(:deleted) }
    it { is_expected.not_to allow_values(nil, '').for(:deleted) }

    it { is_expected.to allow_values(true, false).for(:dead) }
    it { is_expected.not_to allow_values(nil, '').for(:dead) }

    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_uniqueness_of(:identifier) }
  end

end
