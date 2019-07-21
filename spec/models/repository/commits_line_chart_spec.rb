describe Repository::CommitsLineChart do
  let(:frozen_time) { Time.parse('2001-01-01') }

  around { |example| Timecop.freeze(frozen_time, &example) }

  describe '#build' do
    it 'returns a valid line chart' do
      repository = build(
        :repository,
        last_commits_at: [Time.now - 3.days, Time.now - 2.days, Time.now - 1.days, Time.now - 1.days]
      )

      expect(described_class.new(repository.last_commits_at).build).to eq(
        {
          type: 'line',
          data: {
            labels: ['2000-12-29', '2000-12-30', '2000-12-31'],
            datasets: [
              label: 'Number of commits at this day',
              data: [1, 1, 2],
              borderColor: [
                '#2e8ece'
              ],
              backgroundColor: [
                '#98c6e5'
              ]
            ]
          },
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true
                }
              }]
            }
          }
        }
      )
    end

    it 'returns an empty chart if no last commits at are available' do
      repository = build(:repository, last_commits_at: [])

      chart = described_class.new(repository.last_commits_at).build
      expect(chart[:data][:labels]).to eq([])
      expect(chart[:data][:datasets][0][:data]).to eq([])
    end

    it 'orders the last commits at ascending' do
      repository = build(
        :repository,
        last_commits_at: [Time.now - 1.days, Time.now - 3.days, Time.now - 2.days]
      )

      chart = described_class.new(repository.last_commits_at).build
      expect(chart[:data][:labels]).to eq(
        [
          '2000-12-29',
          '2000-12-30',
          '2000-12-31'
        ]
      )
    end
  end
end
