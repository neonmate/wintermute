class Repository::CommitsLineChart

  attr_accessor :last_commits_at

  def initialize(last_commits_at)
    self.last_commits_at = last_commits_at
  end

  def build
    {
      type: 'line',
      data: {
        labels: labels.map { |label| I18n.l(label) },
        datasets: [
          label: 'Number of commits at this day',
          data: dataset,
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
  end

  private

  def labels
    last_commits_at.sort.map(&:to_date).uniq
  end

  def dataset
    labels.map do |date|
      last_commits_at.select { |commit_time| commit_time.to_date == date }.size
    end
  end

end
