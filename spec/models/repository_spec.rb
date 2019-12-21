describe Repository do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:owner) }

    it { is_expected.to belong_to(:user) }
  end

  describe '#default_order' do
    it 'returns the repositories with the latest commits first' do
      repository_1 = create(:repository, last_commit_at: nil)
      repository_2 = create(:repository, last_commit_at: Time.now)
      repository_3 = create(:repository, last_commit_at: Time.now + 1.day)
      repository_4 = create(:repository, last_commit_at: Time.now - 1.day)

      expect(described_class.default_order.pluck(:id)).to eq(
        [
          repository_3.id,
          repository_2.id,
          repository_4.id,
          repository_1.id
        ]
      )
    end
  end

  describe '#destroy' do
    it 'destroys all dependent messages' do
      repository = create(:repository)
      message = create(:message, parent: repository)
      other_message = create(:message)

      expect { repository.destroy! }.to change { Message.count }.from(2).to(1)
      expect(Message.exists?(message.id)).to be(false)
      expect(Message.exists?(other_message.id)).to be(true)
    end
  end

end
