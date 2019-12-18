describe Repository::RecentChangesAnalyzer do

  describe '#count_commits_for_the_last_day' do
    it 'returns the number of commits within the last day' do
      last_commits_at = [Time.now, Time.now - 1.hour, Time.now - 1.day]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_day).to eq(
        '2 commits within the last day.'
      )
    end

    it 'indicates if there might missing commits for the last day' do
      last_commits_at = [Time.now, Time.now - 1.hour]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_day).to eq(
        'More than 2 commits within the last day.'
      )
    end
  end

  describe '#count_commits_for_the_last_week' do
    it 'returns the number of commits within the last week' do
      last_commits_at = [Time.now, Time.now - 1.hour, Time.now - 1.week]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_week).to eq(
        '2 commits within the last week.'
      )
    end

    it 'indicates if there might missing commits for the last week' do
      last_commits_at = [Time.now, Time.now - 1.hour]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_week).to eq(
        'More than 2 commits within the last week.'
      )
    end
  end

  describe '#count_commits_for_the_last_month' do
    it 'returns the number of commits within the last month' do
      last_commits_at = [Time.now, Time.now - 1.hour, Time.now - 1.month]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_month).to eq(
        '2 commits within the last month.'
      )
    end

    it 'indicates if there might missing commits for the last month' do
      last_commits_at = [Time.now, Time.now - 1.hour]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_month).to eq(
        'More than 2 commits within the last month.'
      )
    end
  end

  describe '#count_commits_for_the_last_year' do
    it 'returns the number of commits within the last year' do
      last_commits_at = [Time.now, Time.now - 1.hour, Time.now - 1.year]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_year).to eq(
        '2 commits within the last year.'
      )
    end

    it 'indicates if there might missing commits for the last year' do
      last_commits_at = [Time.now, Time.now - 1.hour]
      repository = build(:repository, last_commits_at: last_commits_at)

      expect(described_class.new(repository).count_commits_for_the_last_year).to eq(
        'More than 2 commits within the last year.'
      )
    end
  end

end
