module RepositoriesHelper
  def commits_line_chart(last_commits_at)
    labels = []
    dataset = []

    series_over_the_last_month = (Date.today - 1.month..Date.today).to_a
    series_over_the_last_month.each_with_index do |date, index|
      number_of_commits_at_this_day = last_commits_at.select { |commit_time| commit_time.to_date == date }.size

      labels << if [0, series_over_the_last_month.size - 1].include?(index)
        t('date.month_names')[date.month]
      else
        date.day
      end

      dataset << number_of_commits_at_this_day
    end

    configuration = {
      type: 'line',
      data: { labels: labels, datasets: [label: 'Commits of the last month', data: dataset] },
      options: {}
    }
    content_tag(:canvas, nil, chart: 'true', 'up-data' => configuration.to_json)
  end
end
