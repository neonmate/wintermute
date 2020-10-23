describe ExternalRepositoryReview do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_presence_of(:homepage_url) }
    it { is_expected.to validate_uniqueness_of(:identifier) }
  end

  describe '.default_order' do
    it 'returns the external repository reviews sorted by created at' do
      external_repository_review_1 = create(:external_repository_review)
      external_repository_review_2 = Timecop.travel(Time.now - 1.day) { create(:external_repository_review) }
      external_repository_review_3 = Timecop.travel(Time.now + 1.day) { create(:external_repository_review) }

      expect(described_class.default_order.pluck(:id)).to eq(
        [
          external_repository_review_3.id,
          external_repository_review_1.id,
          external_repository_review_2.id,
        ]
      )
    end
  end

  describe '.pending' do
    it 'returns all external repository reviews with state pending' do
      external_repository_review_1 = create(:external_repository_review)
      create(:external_repository_review, :added)
      create(:external_repository_review, :rejected)

      expect(described_class.pending).to contain_exactly(external_repository_review_1)
    end
  end

  describe '#owner' do
    it 'returns the owner derived from the identifier' do
      external_repository_review = create(:external_repository_review, identifier: 'neonmate/wintermute')

      expect(external_repository_review.owner).to eq('neonmate')
    end
  end

  describe '#name' do
    it 'returns the name derived from the identifier' do
      external_repository_review = create(:external_repository_review, identifier: 'neonmate/wintermute')

      expect(external_repository_review.name).to eq('wintermute')
    end
  end

  describe '#project_url' do
    it 'returns the project URL derived from the identifier' do
      external_repository_review = create(:external_repository_review, identifier: 'neonmate/wintermute')

      expect(external_repository_review.project_url).to eq('https://github.com/neonmate/wintermute')
    end
  end

end
