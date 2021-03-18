describe Power::DoesExternalRepositoryReviews do

  let!(:external_repository_review) { create(:external_repository_review) }

  describe '#external_repository_reviews' do
    context 'as admin' do
      let(:user) { create(:user, :admin) }

      it 'allows access to all external repository reviews' do
        power = Power.new(user)

        expect(power.external_repository_reviews).to contain_exactly(external_repository_review)
      end
    end

    context 'as user' do
      let(:user) { create(:user) }

      it 'restricts access to all external repository reviews' do
        power = Power.new(user)

        expect(power.external_repository_reviews).to eq(nil)
      end
    end
  end

  describe '#updatable_external_repository_reviews' do
    context 'as admin' do
      let(:user) { create(:user, :admin) }

      it 'allows access to all external repository reviews' do
        power = Power.new(user)

        expect(power.updatable_external_repository_reviews).to contain_exactly(external_repository_review)
      end
    end

    context 'as user' do
      let(:user) { create(:user) }

      it 'restricts access to all external repository reviews' do
        power = Power.new(user)

        expect(power.updatable_external_repository_reviews).to eq(nil)
      end
    end
  end

end
